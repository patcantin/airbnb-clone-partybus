# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning database"


puts "creating user"

User.destroy_all

user = User.create!(name: "user", email: "user@gmail.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil)

puts "creating bus"


Bus.destroy_all

Bus.create!(name: "Wagonners'bus", capacity: 15, description: "For an unrivaled quality of service, Wagonners'bus, with a capacity of 15 people, has a seating configuration and a comfort worthy of a prestigious bus. The state-of-the-art level of finish will undoubtedly leave you indifferent ... So now you just have to come and discover this new concept by organizing your next event in the Wagonners'bus.", price: 250, user_id: user.id)

Option.destroy_all

options = ['Bar', "Alcool", "Toilette"]

options.each do |option|
  Option.create!(name: option)
 end

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

