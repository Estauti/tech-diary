# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Started Seeds'

puts '-- Creating Tags'
5.times do
  Tag.create!(name: FFaker::Lorem.word)
end
puts "-- Tags Created"
puts ''

puts '-- Creating User'
User.create!(
  email: 'victor@example.com', 
  name: 'Victor',
  password: '123123123',
  password_confirmation: '123123123'
)
puts "-- User Created"
puts ''

puts '-- Creating Discoveries'
5.times do
  Discovery.create!(
    text: FFaker::Lorem.sentence,
    user_id: User.last.id
  )
end
puts "-- Discoveries Created"
puts ''

puts 'Finished Seeds'