class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @users = User.all
  end

  def create
    @user = User.all
    message = Message.create message_params
    redirect_to message_path message
  end

  def new
    @message = Message.new
  end

  def show 
    @message = Message.find params[:id]
  end

  def edit
    @message = Creature.find params[:id]
  end

  def destroy
    @user = User.all
    @message = Message.find(params[:id])
    redirect_to message_path
  end

  private

  def message_params
    params.require(:user).permit (:message)
  end
end
