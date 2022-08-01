class User < ApplicationRecord
  has_secure_password

  before_validation :clean_email

	validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: {minimum: 8, maximum: 20}, presence: true
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  def clean_email 
    if email
      self.email = email.strip.downcase
    end
  end


end
