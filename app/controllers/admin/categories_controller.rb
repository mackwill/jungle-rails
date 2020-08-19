class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @products = Product.group(:category_id).all
  end

  def new
    @category = Category.new
  end

  def create
    
    @category = Category.new(name: params[:category][:name])

    if @category.save
      redirect_to [:admin, :categories], notice: "Category created!"
    else
      render new
    end


  end

end
