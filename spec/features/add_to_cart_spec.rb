require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature,  js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price:  64.99
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path

    cart = page.find_link('My Cart')
    expect(cart).to  have_text 'My Cart'

    el = page.first('article')
    expect(el).to have_button 'Add'
    el.click_button('Add')

    cart = page.find_link('My Cart')
    expect(cart).to  have_text 'My Cart (1)'

    # DEBUG / VERIFY
    save_screenshot
  end
end
