require 'rails_helper'

RSpec.describe 'Share movie', type: :feature do
  scenario 'without author' do
    visit new_movie_path
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Require login or register')
  end

  scenario 'with author' do
    visit root_path
    fill_in('username',	with: 'thaichor')
    fill_in('password',	with: '12345678')
    click_button('Login / Register')
    click_link('Share a movie')
    fill_in('movie_url',	with: 'https://www.youtube.com/watch?v=020g-0hhCAU')
    click_button('Share')
    expect(page).to have_content('Share successfully')
  end
end
