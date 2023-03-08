class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.where(user_id: params[:user_id])
    puts @posts[0].comments
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(user_id: params[:user_id], id: params[:id])

    @comments = @post.comments

    puts 'My posts:'
    puts @post
    puts '....'

  end

  def post_params
    params.permit(:user_id, :post_id)
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
