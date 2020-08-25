require 'rails_helper'
# require 'capybara/poltergeist'
# Capybara.default_driver = :poltergeist

RSpec.feature "UserLogins", type: :feature, js: true do

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

     User.create!({
      first_name: 'Nicolas',
      last_name: 'Cage',
      email: 'nicolascage@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    })

  end

  scenario "They see all products" do
    # ACT
    visit '/login'

    
    fill_in 'email', with: 'nicolascage@gmail.com'
    fill_in 'password',  with: 'password'

    click_on 'Submit'
    

    expect(page).to have_css 'article.product', count: 10

    # DEBUG / VERIFY
    save_screenshot
  end
end
