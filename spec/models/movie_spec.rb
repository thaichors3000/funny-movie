require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'associations' do
    it { should belong_to(:author) }
  end

  describe 'validations' do
    it { should validate_presence_of(:url) }
  end

  describe 'callbacks' do
    it "replace 'watch?v=', 'embed/' on url before create" do
      author = User.create(username: 'thaichor', password: '12345678')
      movie = Movie.new(url: 'https://www.youtube.com/watch?v=020g-0hhCAU', author: author)
      movie.save

      expect(movie.reload.url).to eq 'https://www.youtube.com/embed/020g-0hhCAU'
    end
  end
end
