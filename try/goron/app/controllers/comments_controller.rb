class CommentsController < ApplicationController
  master = {}
  def create
    @user = User.find(session[:user_id])
    @album = Album.find(params[:album_id])
    Rails.logger.debug "comment_params: #{comment_params.to_json} user_id: #{session[:user_id]}"
    if comment_params[:user_id].to_i == session[:user_id].to_i
      @comment = @album.comments.create(comment_params)
      redirect_to albums_path(@album)
    else
      flash[:notice] = "Usuario no logueado al sistema"
      redirect_to albums_path(@album)
    end
  end
  def destroy
      @album = Album.find(params[:album_id])
      @comment = @album.comments.find(params[:id])
      @comment.destroy
      redirect_to albums_path(@album)
  end
  private
  def comment_params
    params.require(:comment).permit(:user_id, :comment)
  end
end
