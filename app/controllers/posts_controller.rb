class PostsController < ApplicationController
  def index
    # @user = User.find_by(id: params[:user_id])
    # @posts = @user.posts
    @posts = Post.where(user_id: post_params[:user_id])
  end

  def show
    # @user = User.find_by(id: params[:user_id])
    # @posts = @user.posts
    # @post = @posts.find_by(id: params[:post_id])
    @post = Post.find_by(user_id: post_params[:user_id], id: params[:post_id])
  end

  def post_params
    params.permit(:user_id, :id)
  end
end
