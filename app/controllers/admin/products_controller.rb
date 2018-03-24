class Admin::ProductsController < ApplicationController
  
  def index
    #@products = Product.all
    date = DateTime.now
    @products = Product.where(created_at: date.beginning_of_month..date.end_of_month)
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end
  
  private
  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end
end
