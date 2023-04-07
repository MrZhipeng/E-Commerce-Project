class ProductsController < ApplicationController

  # GET /products
  def index
    @products = Product.all.page(params[:page])
  end

  # GET /products/1
  def show
    @product = Product.find(params[:id])
  end

end
