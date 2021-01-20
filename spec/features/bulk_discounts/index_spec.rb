require 'rails_helper'

RSpec.describe "Bulk Discounts Index" do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')

    @discount1 = @merchant1.bulk_discounts.create!(percentage_discount: '20%', quantity_threshold: 15)
    @discount2 = @merchant1.bulk_discounts.create!(percentage_discount: '15%', quantity_threshold: 10)

    visit merchant_bulk_discounts_path(@merchant1)
  end
  
  describe "As a merchant" do
    it "shows me all of my discounts" do
      expect(page).to have_content(@discount1.percentage_discount)
      expect(page).to have_content(@discount1.quantity_threshold)
    
      expect(page).to have_content(@discount2.percentage_discount)
      expect(page).to have_content(@discount2.quantity_threshold)
    end

    it "has a link to create a new discount" do
      expect(page).to have_link("Create New Discount")

      click_link("Create New Discount")

      expect(current_path).to eq("/merchant/#{@merchant1.id}/bulk_discounts/new")
    end

    it "links each discount to the discount's show page" do
      expect(page).to have_link("#{@discount1.percentage_discount} for #{@discount1.quantity_threshold} items")
      expect(page).to have_link("#{@discount2.percentage_discount} for #{@discount2.quantity_threshold} items")

      click_on "20% for 15 items"

      expect(current_path).to eq("/merchant/#{@merchant1.id}/bulk_discounts/#{@discount1.id}")
    end
  end
end