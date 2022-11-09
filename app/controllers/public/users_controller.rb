class Public::UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(update_params)
       flash[:notice] = "successfully updated!"
       redirect_to users_my_page_path
    else
       render :edit
    end
  end

  def confirm
  end

  private
  def update_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user

    unless current_user
      redirect_to users_my_page_path(current_user)
    end
  end
end
