class Public::UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = current_user
  end

  def edit
  end

  def update
  end

  def confirm
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to users_my_page_path(current_user)
    end
  end
end
