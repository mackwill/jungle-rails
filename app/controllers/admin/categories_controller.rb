class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @products = Product.group(:category_id).all
  end

  def new
    @category = Category.new
  end

  def create
    
  end

end
