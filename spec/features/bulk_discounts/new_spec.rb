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
  end
end