class CommentsController < ApplicationController
  def create
    text = params[:comment]['text']
    post_id = params[:id]
    user_id = params[:user_id]
    comment = Comment.new(user: current_user, post: Post.find(post_id), text: text)
    post = Post.find_by(id: params[:id])
    puts text
    puts post_id
    puts user_id
    puts 'Show comment count:', post.comments_counter
    # comment_count_of_current_post = post.comments_counter
    # post.comments_counter = comment_count_of_current_post + 1
    post.increment!(:comments_counter)
    if comment.save
      flash[:success] = 'Comment saved successfully'
    else
      flash.now[:error] = 'Error: Comment could not be saved at this time'
    end
    redirect_to "/users/#{user_id}/posts/#{post_id}"
  end
end
