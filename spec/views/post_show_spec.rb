require 'rails_helper'

RSpec.describe 'Posts Show Page', type: :system do
  describe 'Show page' do
    it 'I can see the post\'s title.' do # 1
      visit user_post_path(1, 1)
      expect(page).to have_content('Case Study')
    end

    it 'I can see who wrote the post.' do # 2
      visit user_post_path(1, 1)
      expect(page).to have_content('by Tom')
    end

    it 'I can see how many comments it has.' do # 3
      visit user_post_path(1, 1)
      expect(page).to have_content('Comments:')
    end

    it 'I can see how many likes it has.' do # 4
      visit user_post_path(1, 1)
      expect(page).to have_content('Likes:')
    end

    it 'I can see the post body.' do # 5
      visit user_post_path(1, 1)
      expect(page).to have_content('asdfsafsa')
    end

    it 'I can see the username of each commentor.' do # 6
      visit user_post_path(1, 1)
      expect(page).to have_content('Tom')
    end

    it 'I can see the comment each commentor left.' do # 7
      visit user_post_path(1, 1)
      expect(page).to have_content('Hi Tom!')
    end
  end
end
