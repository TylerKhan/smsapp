class PagesController < ApplicationController
  def index
  end

  def incoming_sms
    twilio_sid = ENV['TWILIO_SID']
    twilio_token = ENV['TWILIO_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']

    sender_number = params["From"]

    incoming_message = params["Body"]

    message= "Hello from Tyler's computer. This app would be fun to mess with people."

    if incoming_message == "secret"
      message = "Oblivion is better than Skyrim."
    else
      message = "This is a boring text message."
    end

    @client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    @client.messages.create(
      :from => twilio_phone_number,
      :to => sender_number,
      :body => message
      )

    render :nothung => true
  end
end
