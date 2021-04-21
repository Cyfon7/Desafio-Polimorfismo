class Oneclick < Transbank
    #has_many :transbanks, as: :transbankable
    def type
        @payment.type << " - OneClick"
    end
end
