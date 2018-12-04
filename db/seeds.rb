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
names = ["drf", "sdf", "rts"]
names.each do |name|
  user = User.new(
    email: "#{rand(10..100)}@railstutorial.org",
    password: "foobar",
  )
  user.save!
  puts "#{name}"
end

puts "Created #{User.count} users..."


puts 'Creating alpacas...'
names = ["Bill", "Bob", "Fred"]
names.each do |name|
  alpaca = Alpaca.new(
    name: name,
    price: rand(10..100),
    user: User.all.sample
  )
  alpaca.save!
  puts "#{name}"
end

puts "Created #{Alpaca.count} alpacas..."
