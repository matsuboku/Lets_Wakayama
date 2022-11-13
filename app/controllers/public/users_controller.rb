class Public::UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = current_user
    @posts = @user.posts
    @post = @user.posts
  end

  def edit

  end

  def update
    if @user.update(update_params)
       flash[:notice] = "更新しました!"
       redirect_to users_my_page_path
    else
       render :edit
    end
  end

  def confirm
  end

  def withdraw
    @user = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update!(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def dummy
    redirect_to new_user_registration_path
  end

  private
  def update_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = current_user
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def ensure_guest_user
    @user = current_user
    if @user.name == "guestuser"
      redirect_to users_my_page_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
