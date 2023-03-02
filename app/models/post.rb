class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def update_post_counter
    user.increment!(:Posts_Counter)
  end

  def five_recent_comments
    comments.order('created_at Desc').limit(5)
  end
end
