class User < ApplicationRecord
end

class Post < ApplicationRecord
end

class Comment < ApplicationRecord
end

class Like < ApplicationRecord
end

# A method that returns the 3 most recent posts for a given user.
def read_first_3_in_post(user)
  my_user = User.find_by(name: user)
  Post.where(user_id: my_user.id).last(3)
end

# A method that updates the posts counter for a user.
def update_posts_counter(user)
  my_user = User.find_by(name: user)
  my_user_posts_count = Post.where(user_id: my_user.id).count
  my_user.update(posts_counter: my_user_posts_count)
end

# A method which returns the 5 most recent comments for a given post.
def read_5_most_recent_comments(post)
  my_post = Post.find_by(title: post)
  Comment.where(post_id: my_post.id).last(5)
end

# A method that updates the comments counter for a post.
def update_comments_counter_for_a_post(post)
  my_post = Post.find_by(title: post)
  my_post_comments_count = Comment.where(post_id: my_post.id).count
  my_post.update(comments_counter: my_post_comments_count)
end

# A method that updates the likes counter for a post.
def update_likes_counter_for_a_post(post)
  my_post = Post.find_by(title: post)
  my_post_likes_count = Like.where(post_id: my_post.id).count
  my_post.update(likes_counter: my_post_likes_count)
end
