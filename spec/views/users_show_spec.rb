require 'rails_helper'

RSpec.describe 'Users Show Page', type: :system do
  describe 'Show Page' do
    it 'I can see the user\'s profile picture.' do # 1
      visit user_path('1')
      expect(page).to have_selector('img')
    end

    it 'shows the user name' do # 2
      visit user_path('1')
      expect(page).to have_content('Tom')
    end

    it 'shows the Number of Posts' do # 3
      visit user_path('1')
      expect(page).to have_content('Number of posts:')
    end

    it 'I can see the user\'s bio.' do # 4
      visit user_path('1')
      expect(page).to have_content('Teacher from Mexico.')
    end

    it 'I can see the user\'s first 3 posts.' do # 5
      visit user_path('1')
      expect(page).to have_content('Case Study')
      expect(page).to have_content('Sun')
    end

    it 'I can see a button that lets me view all of a user\'s posts.' do # 6
      visit user_path('1')
      expect(page).to have_content('View All Posts')
    end

    it 'When I click a user\'s post, it redirects me to that post\'s show page.' do # 7
      visit user_path('1')
      click_link 'Case Study'
      expect(page).to have_content('asdfsafsa')
      expect(page).to have_current_path('/users/1/posts/1')
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do # 8
      visit user_path('1')
      click_link 'View All Posts'
      expect(page).to have_current_path('/users/1/posts')
    end
  end
end
