require 'rails_helper'

RSpec.describe 'As a Merchant' do
  it 'I can delete a bulk discount' do
    @merchant1 = Merchant.create!(name: 'Hair Care')

    @discount1 = @merchant1.bulk_discounts.create!(percentage_discount: '20%', quantity_threshold: 15)

    visit merchant_bulk_discounts_path(@merchant1.id)

    click_on 'Delete'
    
    expect(current_path).to eq(merchant_bulk_discounts_path(@merchant1.id))
    expect(page).to_not have_content(@discount1.quantity_threshold)
    expect(page).to_not have_content(@discount1.percentage_discount)
    expect(page).to_not have_button('Delete')
  end
end