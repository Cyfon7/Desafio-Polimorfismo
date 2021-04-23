class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def update
    product = params[:cart][:product_id]
    quantity = params[:cart][:quantity]
  
    current_order.add_product(product, quantity)
  
    redirect_to root_url, notice: "Product added successfuly"
  end
  
  def show
    @order = current_order
  end
  
  def pay
    
    order = Order.find(params[:cart][:order_id])
  
    #price must be in cents
    price = order.total * 100
  
=begin
    response = EXPRESS_GATEWAY.setup_purchase(price,
      ip: request.remote_ip,
      return_url: process_payment_cart_url,
      cancel_return_url: root_url,
      allow_guest_checkout: true,
      currency: "USD"
    )
=end
  
  # payment_method = PaymentMethod.find_by(code: "PEC")
    payment = Payment.new(
      order_id: order.id,
      #type: pay_method,
      state: "completed", #"processing",
      total: order.total,
      #token: pay_method #response.token
    )
    
    
    update_payment_method(payment, params[:cart][:payment_method])

    payment.save
  
    redirect_to payment_url(payment.id)
    #redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end
  
=begin
  def process_payment
    details = EXPRESS_GATEWAY.details_for(params[:token])
    express_purchase_options =
      {
        ip: request.remote_ip,
        token: params[:token],
        payer_id: details.payer_id,
        currency: "USD"
      }
  
    price = details.params["order_total"].to_d * 100
  
    response = EXPRESS_GATEWAY.purchase(price, express_purchase_options)
    if response.success?
      payment = Payment.find_by(token: response.token)
      order = payment.order
  
      #update object states
      payment.state = "completed"
      order.state = "completed"
  
      ActiveRecord::Base.transaction do
        order.save!
        payment.save!
      end
    end
  end
=end

  def update_payment_method (payment_data, payment_type)
    case payment_type
    when Stripe.name
      Stripe.new(payment_data).apply_method
    when Transbank.name
      Transbank.new(payment_data).apply_method
    when Paypal.name
      Paypal.new(payment_data).apply_method
    when Webpay.name
      Webpay.new(payment_data).apply_method
    when Oneclick.name
      Oneclick.new(payment_data).apply_method
    when Creditcard.name
      Creditcard.new(payment_data).apply_method
    end
  end
end