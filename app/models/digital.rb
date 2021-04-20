class Digital < Product
    has_one :image, as: :imageable

    accepts_nested_attributes_for :image

end
