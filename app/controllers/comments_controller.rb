class CommentsController < ApplicationController
  def create
    text = params[:comment]['text']
    post_id = params[:post_id]
    user_id = params[:user_id]
    post = Post.find_by(id: params[:post_id])
    comment = Comment.new(user: current_user, post:, text:)
    puts text
    puts post_id
    puts user_id
    puts post.comments_counter

    post.increment!(:comments_counter)
    if comment.save
      flash[:success] = 'Comment saved successfully'
    else
      flash.now[:error] = 'Error: Comment could not be saved at this time'
    end
    redirect_to "/users/#{user_id}/posts/#{post_id}"
  end

  def new
    @user_id = current_user.id
    @post_id = params[:post_id]

    render 'new'
  end
end
