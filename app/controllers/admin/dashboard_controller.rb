class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_EXAMPLE_USER'], password: ENV['ADMIN_EXAMPLE_PASSWORD']
  # http_basic_authenticate_with name: "Jungle", password: "book"
  def show
  end
end
