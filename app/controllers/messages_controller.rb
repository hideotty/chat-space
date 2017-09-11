class MessagesController < ApplicationController

  before_action :group_params

  def index
    @groups = current_user.groups
    @message = Message.new
    @members = @group.users
    @messages = Message.all
      respond_to do|format|
        format.html
        format.json{ @new_message = Message.where('id > ?', params[:message][:id]) }
      end
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージを投稿しました" }
        format.json
      end
    else
      flash.now[:alart] = "メッセージを入力してください"
      @members = @group.users
      render :index
    end
  end

private
  def message_params
    params.require(:message).permit(:content, :img).merge(group_id: params[:group_id])
  end
  def group_params
    @group = Group.find(params[:group_id])
  end
end
