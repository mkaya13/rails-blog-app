require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before(:example) { get('/users') }
    it 'should return 200 status success code' do
      expect(response).to have_http_status(:ok)
    end
    it 'check if it renders index template of the Users' do
      expect(response).to render_template(:index)
    end
    it 'should have a body that contains This is users index page div' do
      expect(response.body).to include('<div>This is users index page</div>')
    end
  end
  describe 'GET /users/1' do
    before(:example) { get('/users/1') }
    it 'should return 200 status success code' do
      expect(response).to have_http_status(:ok)
    end
    it 'check if it renders show template' do
      expect(response).to render_template(:show)
    end
    it 'should have a body that contains <h1>USER: </h1>' do
      expect(response.body).to include('<h1>USER: </h1>')
    end
  end
end
