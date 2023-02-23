# spec/models/comment_spec.rb

require 'spec_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.new(name: 'Tom', photo: 'image.png', bio: 'I am programmer', posts_counter: 0)
    Post.new(title: 'Hello world', text: 'Helloworld',
             likes_counter: 0, comments_counter: 0, user: user)
  end

  before { subject.save }

  it 'should return most recent comments' do
    user = User.new(name: 'Tom', photo: 'image', bio: 'bio', posts_counter: 0)
    subject.comments.create!(user: user, text: 'glad to see you')
    subject.comments.create!(user: user, text: 'wow man')

    expect(subject.comments_counter).to eql 2
end
