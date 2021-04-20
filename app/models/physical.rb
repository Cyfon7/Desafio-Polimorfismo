class Physical < ApplicationRecord#Product
    has_many :images, as: :imageable
    has_many :products, as: :productable
end
