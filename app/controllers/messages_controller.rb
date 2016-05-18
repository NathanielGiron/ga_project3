class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    puts 'creating a message...'
    @message = Message.create message_params
    PrivatePub.publish_to("/messages/new", "alert('#{@message.body}');")
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
