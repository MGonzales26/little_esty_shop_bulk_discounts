require 'rails_helper'

RSpec.describe "Bulk Discount Page" do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')

    @discount1 = @merchant1.bulk_discounts.create!(percentage_discount: '20%', quantity_threshold: 15)
    @discount2 = @merchant1.bulk_discounts.create!(percentage_discount: '15%', quantity_threshold: 10)
  end

  describe "as a merchant" do
    it "describes the discount" do
      visit merchant_bulk_discount_path(@merchant1, @discount1)

      save_and_open_page
      expect(page).to have_content("When your customer buys #{@discount1.quantity_threshold}, they will recieve a #{@discount1.percentage_discount} discount.")
    end
  end
end