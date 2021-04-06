class Transbank < ApplicationRecord
    has_many :payments, as: :paymentable
end
