class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_EXAMPLE_USER'], password: ENV['ADMIN_EXAMPLE_PASSWORD']


  def show
    @products = Product.all
    @categories = Category.all
  end
end
