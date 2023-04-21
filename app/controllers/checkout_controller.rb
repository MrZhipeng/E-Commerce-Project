class CheckoutController < ApplicationController
  def create
    # establish a connection to Stripe and then redirect the user to the payment screen
    cart_items = cart
    total_price = cart_items.sum(&:price)

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      mode: 'payment',
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
      line_items: [
        {
          price_data: {
            currency: 'cad',
            product_data: {
              name: "Game Center Checkout",
              description: "Purchasing #{cart_items.count} items",
            },
            unit_amount: (total_price * 100).to_i,
          },
          quantity: 1,
        },
      ],
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    # we took the customer's money
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    # something went wrong with payment!
  end
end
