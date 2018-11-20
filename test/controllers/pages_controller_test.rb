require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get incoming_sms" do
    get pages_incoming_sms_url
    assert_response :success
  end

end
