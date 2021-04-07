class Transbank < Payment #ApplicationRecord
    #has_many :payments, as: :paymentable
    #belongs_to :transbankable, polymorphic: true
    def transbank_test
        @transbank_test = "Esto es un test"
    end

end