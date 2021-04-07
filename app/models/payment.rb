class Payment < ApplicationRecord
  #belongs_to :paymentable, polymorphic: true
  belongs_to :order
end
