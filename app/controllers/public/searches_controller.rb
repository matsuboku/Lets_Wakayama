class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
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
