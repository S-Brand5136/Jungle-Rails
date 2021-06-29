require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'They can navigate to the products page, and click a product' do

    visit root_path

    click_link('Details', match: :first)

    sleep 1

    expect(page).to have_css '.product-detail'
 
    save_screenshot 'products_details_page.png'
  end

end
