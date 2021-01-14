require 'rails_helper'

RSpec.describe Reduction, type: :model do
  describe "validations" do
    it { should validate_presence_of :merchant_id}
    it { should validate_presence_of :bulk_discount_id }
  end
  describe "relationships" do
    it { should belong_to :merchant}
    it { should belong_to :bulk_discount}
  end
end
