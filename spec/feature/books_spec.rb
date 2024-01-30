require 'rails_helper'

RSpec.describe 'Books', type: :feature do
  describe 'creating a book' do
    it 'creates a book and shows a flash notice' do
      visit new_book_path
      fill_in 'book_title', with: 'Sample Book'
      # Add other fields as needed
      click_button 'Create Book'

      expect(page).to have_content('Book was successfully created.')
      expect(page).to have_content('Sample Book')  # Assuming the show page displays the book's title
    end

    it 'shows a flash notice for a book with a blank title' do
      visit new_book_path
      fill_in 'book_title', with: ''
      # Add other fields as needed
      click_button 'Create Book'

      expect(page).to have_content("Title can't be blank")
    end
  end
end