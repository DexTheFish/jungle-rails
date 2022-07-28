class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASSWORD"],
  if: -> { ENV["HTTP_BASIC_PASSWORD"].present? }

  def show
    @products_count = Product.count
    @categories_count = Category.count
  end
end

# We could use AR models to query the database directly from the ERB views. However a better, more MVC approach to this is to let the controller fetch the data and pass it to the template. In other words, set instance variables in the controller action with values, and then render those instance variables in the ERB template