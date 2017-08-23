class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
    @members = @group.users
  end

  def create
    @group = Group.find(params[:group_id])
    @groups = Group.all
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      flash.now[:alart] = "メッセージを入力してください"
      render :index
    end
  end

private
  def message_params
    params.require(:message).permit(:content, :img).merge(user_id:current_user.id, group_id:params[:group_id])
  end
end
