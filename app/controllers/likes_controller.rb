class LikesController < ApplicationController
  def create
    puts params
    user_id = params[:user_id]
    post_id = params[:id]
    post = Post.find_by(id: params[:id])

    like = Like.new(user: current_user, post: Post.find(post_id))
    post.increment!(:likes_counter)

    if like.save
      flash[:success] = 'New Like Saved successfully'
    else
      flash.now[:error] = 'Error: Like could not be saved at this time'
    end

    redirect_to "/users/#{user_id}/posts/#{post_id}"
  end
end
