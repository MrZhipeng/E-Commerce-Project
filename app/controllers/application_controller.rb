class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  def index
    @platforms = Platform.all
  end

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def cart
    Product.find(session[:shopping_cart])
  end
end
