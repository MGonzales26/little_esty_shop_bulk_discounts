class RemoveMerchantIdFromBulkDiscounts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bulk_discounts, :merchant, foreign_key: true
  end
end
