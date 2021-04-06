class Paypal < ApplicationRecord
    has_many :payments, as: :paymentable
end
