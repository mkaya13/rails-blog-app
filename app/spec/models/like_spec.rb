require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user = User.new(name: 'Tom', photo: 'gama.png', bio: 'I am a decent person', posts_counter: 0)
    Post.new(title: 'Wow', text: 'Hello moto',
             likes_counter: 0, comments_counter: 0, user_id: user.id)
  end

  user = User.new(name: 'Tom', photo: 'gama.png', bio: 'I am a decent person', posts_counter: 0)

  before { user.save }

  it 'should return most recent comments' do
    user.likes.create!(post: subject)
    user.likes.create!(post: subject)

    expect(subject.likes_counter).to eql 2
  end
end
