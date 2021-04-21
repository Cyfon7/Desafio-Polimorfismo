class Transbank < Payment#ApplicationRecord
    #has_many :payments, as: :paymentable
    #belongs_to :transbankable, polymorphic: true
    attr_accessor :payment

    def initialize(payment)
      @payment = payment
    end
    
    def type
      @payment.type = self.class.name
    end

end