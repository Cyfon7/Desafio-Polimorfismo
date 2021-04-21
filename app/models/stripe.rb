class Stripe < Payment#ApplicationRecord
    #has_many :payments, as: :paymentable
    attr_accessor :payment

    def initialize(payment)
      @payment = payment
    end
    
    def type
      @payment.type = self.class.name
    end
end
