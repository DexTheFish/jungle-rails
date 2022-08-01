require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should validate the name of the product" do
      category = Category.new
      product = Product.new(:name => 'test', :price => 100, :quantity => 100, :category => category)
      expect(product.save).to be true
    end
  end
end
