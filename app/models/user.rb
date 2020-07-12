class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
end
