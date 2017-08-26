class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
    @members = @group.users
    # binding.pry
  end

  def create
       # binding.pry
    @group = Group.find(params[:group_id])
    @groups = Group.all
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(params[:group_id]), notice: "メッセージを投稿しました"
    else
      flash.now[:alart] = "メッセージを入力してください"
      render :index
    end
  end

private
  def message_params
    params.require(:message).permit(:content, :img).merge(group_id: params[:group_id])
  end
end
