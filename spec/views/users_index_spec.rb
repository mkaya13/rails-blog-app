require 'rails_helper'

RSpec.describe 'Users Index Page', type: :system do
  describe 'index page' do
    it 'shows the user name' do
      visit users_path
      expect(page).to have_content('Tom')
    end

    it 'shows the user profile picture' do
      visit users_path
      expect(page).to have_selector('img')
    end

    it 'Can see the number of posts each user has written' do
      visit users_path
      expect(page).to have_content('Number of posts:')
    end

    it 'When I click on a user, I am redirected to that user\'s show page' do
      visit users_path
      click_link 'Tom'
      expect(page).to have_content('Bio')
    end
  end
end
