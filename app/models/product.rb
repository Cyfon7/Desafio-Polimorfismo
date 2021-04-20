class Product < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items

    #has_many :images, as: :imageable
    enum type: [ :Digital, :Physical ]
    
end
