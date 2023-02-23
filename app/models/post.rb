class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  has_many :likes
  has_many :comments

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:Posts_Counter)
  end

  def five_recent_comments
    comments.order('created_at Desc').limit(5)
  end
end
