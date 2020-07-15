require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  scenario 'valid' do
    User.create(username: 'thaichor', password: '12345678')

    visit root_path
    fill_in('username',	with: 'thaichor')
    fill_in('password',	with: '12345678')
    click_button('Login / Register')
    expect(page).to have_content('Login successfully')
  end
end
