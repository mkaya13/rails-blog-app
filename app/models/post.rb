class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, comparison: { greater_than_or_equal_to: 0 },
                                               numericality: { only_integer: true }

  # after_save :update_post_counter

  # def update_post_counter
  #  user.increment!(:Posts_Counter)
  # end

  def five_recent_comments
    comments.order('created_at Desc').limit(5)
  end
end
