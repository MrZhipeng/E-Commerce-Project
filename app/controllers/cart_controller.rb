class CartController < ApplicationController
  def create
    logger.debug ("Adding #{params[:id]} to cart.")
    id = params[:id].to_i
    session[:shopping_cart] << id unless session[:shopping_cart].include?(id)
    # if session[:shopping_cart].include?(id)
    #   flash[:notice] = "#{params[:id]} is already in cart."
    # else
    #   flash[:notice] = "#{params[:id]} added to cart."
    # end
    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    # flash[:notice] = "#{product.name} removed from cart."
    logger.debug ("Removing #{params[:id]} from cart.")
    redirect_to root_path
  end
end
