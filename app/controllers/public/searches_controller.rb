class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    # 検索窓に入力せずボタン押下したらroot_pathに飛ぶ
    if params[:word].empty?
      redirect_to root_path
    end

    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end
  end

end
