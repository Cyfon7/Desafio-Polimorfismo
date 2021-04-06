class Stripe < ApplicationRecord
    has_many :payments, as: :paymentable
end
