## First Steps
Create the project
```rails new mini_project -d postgresql``` 

Test Rails is working
```cd mini_project``` 
```bundle install``` 
```rails db:create``` 
```rails s``` 

Create Animal Scaffold with the fields name & type
```rails g scaffold Animal name type``` 
```rails db:migrate``` 

## Write the model
At the model *animal.rb* define a class method that works with any given animal type (Animal subclasses).
The method will receive 2 arguments:

* *animal_type* should be a string the name of any subclass of Animal.
* *animal_data* should be a generic hash with the info of the animal.

```ruby
class Animal < ApplicationRecord
  attr_accessor :animal

  def self.build(animal_type = self, animal_data = {})
    @animal = animal_type.constantize.new(animal_data)
  end

  def talk
    "Animal Type Not Defined"
  end
end
```

Next by inheritance, we define every type of Animal we want and it unique feature.

```ruby
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
    "Moooooo"
  end
end
```
**Note:** Every subclass object of Animal will be storage in the table *:animals*.

## Redirecting routes
To ensure that every type of Animal use the same generic routes, we add the following line for every one of them:
```ruby
resources :type_of_animal, path: :animals
```

Given the example, our *routes.rb* should be like
```ruby
Rails.application.routes.draw do
  resources :animals
  root "animals#index"

  resources :dogs, path: :animals
  resources :cats, path: :animals
  resources :cows, path: :animals
end
```

## Controller adjustments
Once the model is ready, we need to do a few adjustments to the controller code.
1. Modify method *create*, by changing the line where ```@animal``` is instantiated
 
```ruby
@animal = Animal.build(params[get_param][:type], animal_params)
```
2. Add a private method in order to get what type of Animal is present into the params
```ruby
def get_param
  animal_subclass_list = Animal.subclasses.map {|animal| animal.name.downcase}
  params.each do |key, value|
    animal_subclass_list.each do |animal|
      if key == animal
        return key
      end
    end
  end
  return nil
end
```
3. Modify the method *animal_params* to keep the code generic
```ruby
def animal_params
  params[:animal] = params[get_param]
  params.require(:animal).permit(:name, :type)
end
```

## Fixing Views
Finally to ensure *type* field values to be only the Animal subclasses we defined, the following modification must be done in the ```_form.html.erb``` file

```html
<div class="field">
  <%= form.label :type %>
  <%= form.select :type, Animal.subclasses.map { |animal| animal.name } %>
</div>
```

## Console time!
With all set and ready, its time to try some stuff in the console

First lets instantiate a generic Animal
```
animal = Animal.new
 => #<Animal id: nil, type: nil, name: nil, created_at: nil, updated_at: nil> 
 
 animal.talk
 => "Animal Type Not Defined" 
 ```
 
Now lets do the same but with our *build* method
```
animal = Animal.build("Dog", name: "Doge")
=> #<Dog id: nil, type: "Dog", name: "Doge", created_at: nil, updated_at: nil>

animal.talk
 => "Guau Guau" 
```
