require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    # these tests for the Product model could be improved by using the .errors.full_messages array 
    it "should not save with incomplete (invalid) data" do
      user = User.new
      expect(user).not_to be_valid
    end
    it "should save with complete (valid) data" do
      user = User.new(:first_name => 'Dex', :last_name => 'Davis', :password => '123', :password_confirmation => '123', email: 'john@example.com')
      expect(user.save).to be true
    end
    it "Should not save if password does not match confirmation" do
      user = User.new(:first_name => 'Dex', :last_name => 'Davis', :password => '123', :password_confirmation => '1234', email: 'john@example.com')
      expect(user.save).to be false
    end
    # TODO: the following test fails because email uniqueness is not case-insensitive.
    # the model itself should be updated to get this test to pass.
    it "Should not save if email is already registered" do
      user1 = User.new(:first_name => 'Dex', :last_name => 'Davis', :password => '123', :password_confirmation => '123', email: 'dex@example.com')
      user1.save
      user2 = User.new(:first_name => 'FakeDex', :last_name => 'NotTheOriginal', :password => '123', :password_confirmation => '123', email: 'dEX@example.com')
      expect(user2).not_to be_valid
    end


  end
end