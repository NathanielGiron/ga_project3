class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @users = User.all
    if !@user
      flash[:alert] = "You must be logged in to chat!"
      redirect_to new_user_session_path
    end
  end

  def create
    @message = Message.create message_params
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
