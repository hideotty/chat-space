class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
    @message = Message.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      flash.now[:alart] = "グループ名を入力してください"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: "グループ情報を更新しました"
    else
      flash.now[:alart] = "更新に失敗しました"
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
