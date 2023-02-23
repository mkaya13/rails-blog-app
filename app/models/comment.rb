class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  belongs_to :post

  def update_comments_counter
    post.increment!(:Comments_Counter)
  end
end
