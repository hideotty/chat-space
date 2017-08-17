class GroupsController < ApplicationController
  def index
    @groups = Group.all

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

  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
