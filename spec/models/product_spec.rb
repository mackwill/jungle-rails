require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

      @category = Category.find_or_create_by! name: 'Test'

      @category.products.create({
        name: 'Nicolas Cage Hair',
        price_cents: '9999',
        quantity: 1
      })


    it 'saves a new category and product when created' do
      expect(Category.where(name: 'Test')).to exist
      expect(Product.where(name: 'Nicolas Cage Hair')).to exist
    end
    
    it 'has a product name' do
      @test_prod = Product.where(name: 'Nicolas Cage Hair')

      expect(@test_prod.name).to be_present
    end

    it 'has a product price' do
      @test_prod = Product.where(name: 'Nicolas Cage Hair')
      puts "Stuff #{@test_prod}"
      expect(@test_prod.first.attributes["price_cents"]).to be_present
    end

    it 'has a product quantity' do
      @test_prod = Product.where(name: 'Nicolas Cage Hair')
      expect(@test_prod.first.attributes["quantity"]).to be_present
    end

    it 'has a product category' do
      @test_prod = Product.where(name: 'Nicolas Cage Hair')
      expect(@test_prod.first.attributes["category_id"]).to be_present
    end
  end
end
