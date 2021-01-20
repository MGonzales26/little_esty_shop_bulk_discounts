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

  def edit
    @discount = BulkDiscount.find(params[:id])
    @percentage = @discount.percentage_discount
    @quantity = @discount.quantity_threshold
  end

  def update
    @discount = BulkDiscount.find(params[:id])
    @discount.update({quantity_threshold: params[:quantity_threshold],
                     percentage_discount: "#{params[:percentage_discount]}%"})
    redirect_to merchant_bulk_discount_path(params[:merchant_id], params[:id])
  end
end