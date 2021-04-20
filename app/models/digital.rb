class Digital < ApplicationRecord#Product
    has_one :image, as: :imageable
    has_many :products, as: :productable
end
