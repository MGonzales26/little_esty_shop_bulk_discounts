require 'rails_helper'

RSpec.describe "New Bulk Discount Page" do
  describe "as a merchant" do
    before :each do
      @merchant1 = Merchant.create!(name: 'Hair Care')

      visit merchant_bulk_discounts_path(@merchant1)

      click_link "Create New Discount"
    end

    it "has a form to create a new Discount" do
      expect(page).to have_field(:quantity_threshold)
      expect(page).to have_field(:percentage_discount)
    end

    it "creates a new Bulk Discount" do
      fill_in "quantity_threshold", with: 15
      fill_in "percentage_discount", with: "20"
      
      click_on "Save"
      expect(current_path).to eq("/merchant/#{@merchant1.id}/bulk_discounts")
      
      expect(page).to have_content(15)
      expect(page).to have_content("20%")
    end
  end
end