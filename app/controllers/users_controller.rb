class UsersController < ApplicationController

def index
  @users = User.where('name LIKE(?)', "#{params[:keyword]}%")
  respond_to do |format|
        format.html { redirect_to users_path, notice: "メンバーを追加しました" }
        format.json
  end
end

def edit
end

def update
  if current_user.update(user_params)
    redirect_to root_path
  else
    flash.now[:alart] ="更新に失敗しました"
    render :edit
  end
end

private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end

