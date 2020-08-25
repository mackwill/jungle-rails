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
      @category = Category.find_or_create_by! name: 'Test'

      @category.products.create({
        name: 'Nicolas Cage Hair',
        price_cents: '9999',
        quantity: 1
      })

      expect(Category.where(name: 'Test')).to exist
      expect(Product.where(name: 'Nicolas Cage Hair')).to exist
    end
    
    it 'has a product name' do
      @category = Category.find_or_create_by! name: 'Test'

      @category.products.create({
        name: 'Nicolas Cage Hair',
        price_cents: '9999',
        quantity: 1
      })

      @test_prod = Product.where(name: 'Nicolas Cage Hair')

      expect(@test_prod.name).to be_present
    end

    it 'has a product price' do
      @category = Category.find_or_create_by! name: 'Test'

      @category.products.create({
        name: 'Nicolas Cage Hair',
        price_cents: '9999',
        quantity: 1
      })

      @test_prod = Product.where(name: 'Nicolas Cage Hair')
      puts "Stuff #{@test_prod}"
      expect(@test_prod.first.attributes["price_cents"]).to be_present
    end

    it 'has a product quantity' do
      @category = Category.find_or_create_by! name: 'Test'

      @category.products.create({
        name: 'Nicolas Cage Hair',
        price_cents: '9999',
        quantity: 1
      })

      @test_prod = Product.where(name: 'Nicolas Cage Hair')
      expect(@test_prod.first.attributes["quantity"]).to be_present
    end

    it 'has a product category' do
      @category = Category.find_or_create_by! name: 'Test'

      @category.products.create({
        name: 'Nicolas Cage Hair',
        price_cents: '9999',
        quantity: 1
      })

      @test_prod = Product.where(name: 'Nicolas Cage Hair')
      expect(@test_prod.first.attributes["category_id"]).to be_present
    end
  end
end
