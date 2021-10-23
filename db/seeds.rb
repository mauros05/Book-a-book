require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Book.destroy_all
User.destroy_all

puts "Creating users and books... "

15.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "123456",
    password_confirmation: "123456",
    name: Faker::Name.name,
    username: Faker::Games::Pokemon.name,
    city: Faker::Address.city
  )
  10.times do
  Book.create!(
    title: Faker::Book.title,
    edition: rand(10),
    author: Faker::Book.author,
    user: user
  )
  end
end

puts "Done!"
