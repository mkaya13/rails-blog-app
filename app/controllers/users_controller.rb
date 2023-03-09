# app/controllers/user_controller.rb

class UsersController < ApplicationController
  layout 'application'
  def index
    @users = User.includes(:posts)
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end
end
