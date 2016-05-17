class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @users = User.all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @user = User.all
    message = Message.create params_model
    json  = model.to_json
    redirect_to message_path message
    Pusher[channel].trigger 'messages/create', json
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

  def params_model
    params.require(:message).permit(:id,:body,:user_id)
  end
end
