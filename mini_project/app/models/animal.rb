class Animal < ApplicationRecord

    attr_accessor :animal

    def self.build(animal_type = self, animal_data = {})
        @animal = animal_type.constantize.new(animal_data)
    end

    def talk
        "Animal Type Not Defined"
    end

end

class Dog < Animal
    def talk
        "Guau Guau"
    end 
end

class Cat < Animal
    def talk
        "Miau Miau"
    end
end

class Cow < Animal
    def talk
        "Moooo"
    end
end