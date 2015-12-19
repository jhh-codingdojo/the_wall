class LikesController < ApplicationController
  def create
    like = Like.new(likes_param)
    like.user = User.find(session[:user_id])
    if like.save
      redirect_to "/the_wall"
    else
      flash[:likes_errors] = like.errors.full_messages
      redirect_to "/the_wall"
    end
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_to "/the_wall"
  end
  private

  def likes_param
    params.require(:like).permit(:parent_id,:parent_type)
  end

  def show
    @likes = Like.find(params[:id])
  end
end
