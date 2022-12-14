class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
  before_action :correct_user, only:[:edit, :update]

  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: "投稿しました."
    else
      render :new
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "更新しました."
    else
      render "edit"
    end
  end

  def search
    maps = Map.where(latitude: params[:latitude]).where(longitude: params[:longitude])
    @marker_arr =[]
    maps.each do |map|
      #pushメソッドは配列に値を入れるメソッド
      @marker_arr.push(map.post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :explanation, :genre_id, :latitude, :longitude)
  end

  def correct_user
    @post = Post.find(params[:id])
    @user = @post.user
    redirect_to(posts_path) unless @user == current_user
  end
end
