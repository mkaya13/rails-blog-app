require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:id/posts' do
    before(:example) { get('/users/1/posts') }
    it 'should return 200 status success code' do
      expect(response).to have_http_status(:ok)
      puts 'Here is my body'
      puts response.body
    end
    it 'check if it renders index template of the Posts' do
      expect(response).to render_template(:index)
    end

    it 'should have a body that contains <div>This is users/:user_id/posts page</div>' do
      expect(response.body).to include('<div>This is users/:user_id/posts page</div>')
    end
  end
  describe 'GET /show' do
    before(:example) { get('/users/1/posts/1') }
    it 'should return 200 status success code' do
      expect(response).to have_http_status(:ok)
    end
    it 'check if it renders index template of the show' do
      expect(response).to render_template(:show)
    end
    it 'should have a body that contains <h1>Post: </h1>' do
      expect(response.body).to include('<h1>Post: </h1>')
    end
  end
end
