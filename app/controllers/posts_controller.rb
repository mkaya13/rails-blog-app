class PostsController < ApplicationController
  def index
    # @user = User.find_by(id: params[:user_id])
    # @posts = @user.posts
    # @posts = Post.where(user_id: post_params[:user_id])
    @posts = Post.where(user_id: post_params[:user_id]).includes(:comments)
  end

  def show
    # @user = User.find_by(id: params[:user_id])
    # @posts = @user.posts
    # @post = @posts.find_by(id: params[:post_id])
    # @post = Post.find_by(user_id: post_params[:user_id], id: params[:post_id])

    @post = Post.find_by(user_id: params[:user_id], id: params[:post_id])
    @comments = @post.comments

    @user = User.find(@post.user_id)
  end

  def post_params
    params.permit(:user_id, :id)
  end

  def new
    @id = current_user.id
    render 'new'
  end

  def create
    title = params[:post]['title']
    text = params[:post]['text']
    post = Post.new(user_id: current_user.id, title:, text:, comments_counter: 0, likes_counter: 0)

    if post.save
      flash[:success] = 'Post saved successfully'
      redirect_to "/users/#{current_user.id}/posts"
    else
      flash.now[:error] = 'Error: Question could not be saved'
      render 'new'
    end
  end
end
