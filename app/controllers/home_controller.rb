class HomeController < ApplicationController
  def index
    @new_products = Product.order(created_at: :desc).limit(10)

    @products = Kaminari.paginate_array(@new_products).page(params[:page]).per(9)
  end
end
