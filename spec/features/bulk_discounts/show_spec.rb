require 'rails_helper'

RSpec.describe "Bulk Discount Page" do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')

    @discount1 = @merchant1.bulk_discounts.create!(percentage_discount: '20%', quantity_threshold: 15)
    @discount2 = @merchant1.bulk_discounts.create!(percentage_discount: '15%', quantity_threshold: 10)

    visit merchant_bulk_discount_path(@merchant1, @discount1)
  end

  describe "as a merchant" do
    it "describes the discount" do
      expect(page).to have_content("When your customer buys #{@discount1.quantity_threshold} items, they will recieve a #{@discount1.percentage_discount} discount.")
    end

    it "has a link to edit that leads to the edit form" do
      expect(page).to have_link("Edit")

      click_link "Edit"

      expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant1, @discount1))
    end
  end
end