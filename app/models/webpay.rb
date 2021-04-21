class Webpay < Transbank
    #has_many :transbanks, as: :transbankable
    def type
        @payment.type << " - Webpay"
    end

end
