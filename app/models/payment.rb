class Payment < ApplicationRecord
  
  belongs_to :order
  
  scope :get_paymentmethod, -> { subclasses[0].descendants.map { |method| [ method.name , method.name ] } }

end

class PaymentMethod < Payment
  attr_accessor :payment

  def initialize(payment)
    @payment = payment
  end

  def apply_method
    @payment.token = self.class.name.upcase[0..2]
    @payment.type = self.class.name
  end
end

class Stripe < PaymentMethod
end

class Paypal < PaymentMethod
end

class Transbank < PaymentMethod
end

class Webpay < Transbank
  def apply_method
    @payment.token = self.class.superclass.name.upcase[0..2] + self.class.name.upcase[0..2]
    @payment.type = self.class.name
  end
end

class Oneclick < Transbank
  def apply_method
    @payment.token = self.class.superclass.name.upcase[0..2] + self.class.name.upcase[0..2]
    @payment.type = self.class.name
  end
end

class Creditcard < Transbank   
  def apply_method
    @payment.token = self.class.superclass.name.upcase[0..2] + self.class.name.upcase[0..2]
    @payment.type = self.class.name
  end
end
