class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post

  def update_likes_counter
    post.increment!(:Likes_Counter)
  end
end
