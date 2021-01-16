require 'rails_helper'

RSpec.describe "Bulk Discount Edit Page" do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')

    @discount1 = @merchant1.bulk_discounts.create!(percentage_discount: '20%', quantity_threshold: 15)

    visit edit_merchant_bulk_discount_path(@merchant1, @discount1)
  end

  describe "as a merchant" do
    it "has a form to edit the bulk discount" do
      expect(page).to have_field(:quantity_threshold)
      expect(page).to have_field(:percentage_discount)
    end

    it "auto populates current values" do
      expect(find_field('quantity_threshold').value).to eq("15")
      expect(find_field('percentage_discount').value).to eq("20%")
    end

    it "changes the discount when edited" do
      fill_in "quantity_threshold", with: 20
      fill_in "percentage_discount", with: "30"
      
      click_on "Save"
      expect(current_path).to eq("/merchant/#{@merchant1.id}/bulk_discounts/#{@discount1.id}")

      expect(page).to have_no_content(15)
      expect(page).to have_no_content("20%")
      expect(page).to have_content(20)
      expect(page).to have_content("30%")
    end
  end
end