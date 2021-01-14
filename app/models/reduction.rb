class Reduction < ApplicationRecord
  validates_presence_of :merchant_id
  validates_presence_of :bulk_discount_id

  belongs_to :merchant
  belongs_to :bulk_discount
end