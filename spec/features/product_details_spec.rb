require 'rails_helper'

RSpec.feature "ProductDetailds", type: :feature, js: true do
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
    # page.first('.product').find_link('Details »').click
    # el = page.first :link, 'Details'

    # el.click
    # el = page.first :link, href: '/products/10'
    # puts el.inspect
    # el.trigger 'click'
    # el = page.first('.product')
    # el.find('Details', class: 'btn').click
    # expect(page).to have_text 'Details'
    el = page.first('article')
    expect(el).to have_link 'Details'
    el.click
    # puts el.i/nspect
    # page.first('article').find('footer').click_link('/products/10')
    # el.click
    # el.trigger 'click'
    # click_on 'Login'
    puts page.html
    # puts page.html
    # DEBUG / VERIFY
    # save_screenshot
  end

end

