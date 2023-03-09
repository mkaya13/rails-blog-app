require 'rails_helper'

RSpec.describe 'Posts Index Page', type: :system do
  describe 'index page' do
    it 'I can see the user\'s profile picture.' do # 1
      visit user_posts_path('1')
      expect(page).to have_selector('img')
    end

    it 'shows the user name' do # 2
      visit user_posts_path('1')
      expect(page).to have_content('Tom')
    end

    it 'shows the nuber of posts user wrote' do # 3
      visit user_posts_path('1')
      expect(page).to have_content('Number of posts:')
    end

    it 'I can see a post\'s title.' do # 4
      visit user_posts_path('1')
      expect(page).to have_content('1')
    end

    it 'I can see some of the post\'s body.' do # 5
      visit user_posts_path('1')
      expect(page).to have_content('asdfsafsa')
    end

    it 'I can see the first comments on a post.' do # 6
      visit user_posts_path('1')
      expect(page).to have_content('Hi Tom')
    end

    it 'I can see how many comments a post has.' do # 7
      visit user_posts_path('1')
      expect(page).to have_content('Comments No:')
    end

    it 'I can see how many likes a post has.' do # 8
      visit user_posts_path('1')
      expect(page).to have_content('Likes No:')
    end

    it 'I can see a section for pagination if there are more posts than fit on the view.' do # 9
      visit user_posts_path('1')
      expect(page).to have_content('Pagination')
    end
    it 'When I click on a post, it redirects me to that post\'s show page.' do # 10
      visit user_posts_path('1')
      click_link 'Case Study'
      expect(page).to have_current_path('/users/1/posts/1')
    end
  end
end
