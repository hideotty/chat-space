class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups = Group.all
    @message = Message.new
  end

  def create
    @group = Group.find(params[:group_id])
    @groups = Group.all
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      flash.now[:alart]
      render :index
    end
  end

private
  def message_params
    params.require(:message).permit(:content).merge(user_id:current_user.id, group_id:params[:group_id])
  end
end
