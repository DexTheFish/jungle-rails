class User < ApplicationRecord

  has_secure_password

  # every user should have a unique email address
  validates :email, presence: true, uniqueness: true

end
