class ProductsController < ApplicationController

  # GET /products
  def index
    @products = Product.all

    if params[:on_sale] == "true"
      @products = @products.where.not(on_sale_price: nil)
    end

    if params[:added_this_week] == "true"
      @products = @products.where("created_at >= ?", 1.week.ago)
    end

    @products = @products.page(params[:page])
  end

  # GET /products/1
  def show
    @product = Product.find(params[:id])
  end

  def search
    wildcard_search_term = "%#{params[:keywords]}%"
    @products = Product.where("name LIKE ?", wildcard_search_term).page(params[:page])

    if params[:id].present?
      @products = @products.where("platform_id = ?", params[:id]).page(params[:page])
    end
  end

end
