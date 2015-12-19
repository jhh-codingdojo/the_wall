class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.user = User.find(session[:user_id])
    if comment.save
      redirect_to "/the_wall"
    else
      flash[:comment_error] = comment.errors.full_messages
      redirect_to "/the_wall"
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to "/the_wall"
  end

  def update
    Comment.find(params[:id]).update(comment_params)
    redirect_to "/the_wall"
  end
  def index
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def new
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
