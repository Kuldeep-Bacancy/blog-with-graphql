# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    street: Faker::Address.street_name,
    number: Faker::Address.building_number,
    city: Faker::Address.city,
    postcode: Faker::Address.postcode,
    country: Faker::Address.country
  )

  post = user.posts.create(body: Faker::Marketing.buzzwords)
  user.comments.create(body: Faker::Marketing.buzzwords, post:)
end
