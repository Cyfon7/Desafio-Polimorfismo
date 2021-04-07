class Oneclick < Transbank
    #has_many :transbanks, as: :transbankable
    def type
        @type = "Transbank - Oneclick"
    end
end
