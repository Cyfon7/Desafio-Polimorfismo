class Product < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items

    belongs_to :productable, polymorphic: true, optional: true

    #enum type: [ :Digital, :Physical ]
    
end
