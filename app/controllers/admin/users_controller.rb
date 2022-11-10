class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_params)
       flash[:notice] = "更新しました。"
       redirect_to admin_user_path(@user)
    else
       render :edit
    end
  end

  private
  def update_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end
end
