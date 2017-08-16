class GroupsController < ApplicationController
  def index
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
end
