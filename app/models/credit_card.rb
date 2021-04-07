class CreditCard < Transbank
    #has_many :transbanks, as: :transbankable
    def type
        @type = "Transbank - CreditCard"
    end
end
