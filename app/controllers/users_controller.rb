# app/controllers/user_controller.rb

class UsersController < ApplicationController
  layout 'application'
  def index
    @users = User.all
    # @users = User.all.includes(:posts, :comments)

    # SELECT * FROM users
    # SELECT * FROM posts WHERE user_id = id
    # SELECT * FROM comments WHERE user_id = id
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end
end
