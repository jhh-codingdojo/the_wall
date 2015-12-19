class PostsController < ApplicationController
  def create
    post = Post.new(post_params)
    post.user = User.find(session[:user_id])
    if post.save
      redirect_to "/the_wall"
    else
      flash[:post_error] = post.errors.full_messages
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to "/the_wall"
  end

  def update
    Post.find(params[:id]).update(post_params)
    redirect_to "/the_wall"
  end

  def index
    @current_user = User.find(session[:user_id])
    @posts = Post.all
  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
