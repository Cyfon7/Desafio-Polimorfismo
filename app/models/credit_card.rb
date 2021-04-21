class CreditCard < Transbank
    #has_many :transbanks, as: :transbankable
    def type
        @payment.type << " - CreditCard"
    end
end
