class Public::HomesController < ApplicationController
  
  def top
    @genres = Genre.all
    @posts = Post.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @posts = @genre.posts
    end
  end

  def about
  end
end
