class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post

  def update_comments_counter
    post.increment!(:Comments_Counter)
  end
end
