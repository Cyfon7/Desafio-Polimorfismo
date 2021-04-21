class Payment < ApplicationRecord
  #belongs_to :paymentable, polymorphic: true
  belongs_to :order
  
  def type
    "Payment_method not defined"
  end

end