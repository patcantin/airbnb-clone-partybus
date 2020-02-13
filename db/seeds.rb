# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning database"


puts "creating user"

User.create!(email: "4473@localhost", password: "erhgerlhge33", encrypted_password: "$2a$10$5eoHh6M2q4GjGkHClO.NqebWWhS94D8rNj5Ot6CB2qrbn7IrTfkSa", reset_password_token: nil, reset_password_sent_at: nil)

puts "creating bus"

Bus.create!(name: "gin", capacity: 15, description: "harghaehgl", price: 250, user_id: 1, id: 3)


# Creating ingredients by parsing API
# require 'json'
# require 'open-uri'

# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# user_serialized = open(url).read
# user = JSON.parse(user_serialized)

# arr = user["drinks"]
# arr.each do |i|
#   Ingredient.create(name: i["strIngredient1"])
# end

# puts "creating cocktails"

# ginto = Cocktail.create!(name: "gin tonic")

# puts "creating doses"

# Dose.create!(cocktail: ginto, ingredient: gin, description: "45ml (1 1/2 oz)")
# Dose.create!(cocktail: ginto, ingredient: to, description: "60 ml (2oz)")
# Dose.create!(cocktail: ginto, ingredient: grape, description: "1 slice")
# Dose.create!(cocktail: ginto, ingredient: ice, description: "3 or 4")

puts "finished ! you can play now."

