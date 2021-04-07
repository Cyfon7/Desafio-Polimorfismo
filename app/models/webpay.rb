class Webpay < Transbank
    #has_many :transbanks, as: :transbankable
    def type
        @type = "Transbank - Webpay"
    end

end
