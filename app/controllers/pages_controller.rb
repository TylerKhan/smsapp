class PagesController < ApplicationController
  def index
    @message = Messages.all
  end

  def incoming_sms
    twilio_sid = ENV['TWILIO_SID']
    twilio_token = ENV['TWILIO_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']

    sender_number = params["From"]

    incoming_message = params["Body"]

    message= "Hello from Tyler's computer. This app would be fun to mess with people."

    @new_message = Message.new
    @new_message.from_number = params["From"]
    @new_message.message_body = params["Body"]
    @new_message.save



    if incoming_message == "secret"
      message = "Oblivion is better than Skyrim."
    else
      message = "This is a boring text message."
    end

    case incoming_message
    when "Secret"
      message = "Oblivion is better than Skyrimn"
    when "Pizza"
      message = "Do you want to order pizza?"
    else
      message = "How dare you send this boring message."

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
