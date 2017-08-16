class GroupsController < ApplicationController
  # before_action :set_group, only:[:index]
  def index
    @groups = Group.all

  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    else
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

  # def set_group
  #   @group = Group.find(params[:id])
  # end
end
