class Movie < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :url, presence: :true
end
