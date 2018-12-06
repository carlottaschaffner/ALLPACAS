# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Alpaca.destroy_all
User.destroy_all

puts 'Creating users...'
names = ["Carlotta", "Daniel", "Ines"]
names.each do |name|
  user = User.new(
    email: "#{rand(1..1000)}@railstutorial.org",
    password: "foobar",
  )
  user.save!
  puts "#{name}"
end

puts "Created #{User.count} users..."


puts 'Creating alpacas...'
names = ["Bill", "Bob", "Fred", "Paco", "Jorge", "Andy", "Sherman"]
names.each do |name|
  alpaca = Alpaca.new(
    name: name,
    price: rand(10..100),
    color: ["brown", "camel", "cream", "off-white", "chocolate", "coffee"].sample,
    description: Faker::GameOfThrones.quote,
    address: Faker::Address.city,
    age: rand(1..54),
    user: User.all.sample
  )
  alpaca.save!
  puts "#{name}"
end

puts "Created #{Alpaca.count} alpacas..."


# Seed bookings
puts 'Creating bookings...'

10.times do |booking|
  booking = Booking.new(
    start_date: 20181201,
    end_date: 20181202,
    user: User.all.sample,
    alpaca: Alpaca.all.sample
  )
  booking.save!
  puts "#{booking}"
end

puts "Created #{Booking.count} reviews..."


# Seed reviews
puts 'Creating reviews...'
titles = [
  "Great allpaca!",
  "Amazing experience!",
  "5 stars"
]

description = [
  "The owner was communicative and the alpaca was super perky!",
  "Jonny Alpacker is the best one in the world",
  "Amazing experience, the alpaca was super fluffy."
]

100.times do |review|
  review = Review.new(
    title: titles.sample,
    description: Faker::GameOfThrones.quote,
    rating: rand(3..5),
    booking: Booking.all.sample
  )
  review.save!
  puts "#{review.title}"
end

puts "Created #{Review.count} reviews..."
