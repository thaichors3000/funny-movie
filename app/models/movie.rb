class Movie < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :url, presence: :true

  before_create :set_url

  protected

  def set_url
    self.url = url.gsub('watch?v=', 'embed/')
  end
end
