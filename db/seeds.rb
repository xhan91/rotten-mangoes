# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  title = Faker::Space.planet
  director = Faker::Name.name
  runtime_in_minutes = Faker::Number.between(80, 150)
  description = Faker::Lorem.paragraph
  release_date = Faker::Date.backward(365)
  Movie.create(
    title: title,
    director: director,
    runtime_in_minutes: runtime_in_minutes,
    description: description,
    release_date: release_date)
end