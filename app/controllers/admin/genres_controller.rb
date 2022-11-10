class Admin::GenresController < ApplicationController
  def index
    @genres =  Genre.all
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(genre_params)
   if @genre.save
     flash[:notice] = "ジャンルを追加しました。"
     redirect_to admin_genres_path
   else
     flash[:notice] = "ジャンルを追加できませんでした。"
     @genres = Genre.all
     render 'index'
   end
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
     flash[:notice] = "更新しました"
     redirect_to admin_genres_path
    else
     @genre = Genre.find(params[:id])
     render 'edit'
    end
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
