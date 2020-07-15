require 'rails_helper'

RSpec.describe 'Register', type: :feature do
  scenario 'valid' do
    visit root_path
    fill_in('username',	with: 'thaichor')
    fill_in('password',	with: '12345678')
    click_button('Login / Register')
    expect(page).to have_content('Register successfully')
  end
end
