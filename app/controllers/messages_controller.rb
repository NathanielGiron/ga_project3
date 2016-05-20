class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = Message.all
    @users = User.all
  end

  def create
    @message = Message.create message_params
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
