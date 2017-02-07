class AlbumsController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
    @albums = Album.all
  end
  def show
    @user = User.find_by_id(session[:user_id])
    @album = Album.find(params[:id])
  end
  def new
    @user = User.find_by_id(session[:user_id])
    @album = @user.albums.create
  end
  def edit
    @user = User.find_by_id(session[:user_id])
    @album = @user.albums.find(params[:id])
  end
  def create
    @user = User.find_by_id(session[:user_id])
    @album = @user.albums.new(album_params)
    if @album.save
      redirect_to @album
    else
      render 'new'
    end
  end
  def update
    @user = User.find_by_id(session[:user_id])
    @album = @user.albums.find(params[:id])
    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end
  def destroy
    @user = User.find_by_id(session[:user_id])
    @album = @user.albums.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end
  private
  def album_params
    params.require(:album).permit(:title, :body)
  end
end
