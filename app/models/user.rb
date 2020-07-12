class User < ApplicationRecord
  has_secure_password

  has_many :movies, class_name: 'Movie', foreign_key: :author_id

  validates :username, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
end
