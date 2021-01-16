class BulkDiscountsController < ApplicationController

  def index
    @merchant = Merchant.find(params[:merchant_id])
  end
  
  def new
    
  end
  
  def create
    @merchant = Merchant.find(params[:merchant_id])
    @merchant.bulk_discounts.create!(quantity_threshold: params[:quantity_threshold],
      percentage_discount: "#{params[:percentage_discount]}%")
      redirect_to merchant_bulk_discounts_path(@merchant.id)
    end
    
    def show
      @bulk_discount = BulkDiscount.find(params[:id])
  end

  def destroy
    BulkDiscount.destroy(params[:id])
    redirect_to merchant_bulk_discounts_path(params[:merchant_id])
  end
end