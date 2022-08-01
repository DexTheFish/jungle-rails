class User < ApplicationRecord
  has_secure_password

	validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: {minimum: 8, maximum: 20}, presence: true
  validates :password_confirmation, presence: true
end
