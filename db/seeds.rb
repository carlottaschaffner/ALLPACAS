# Creates users
puts 'Creating users...'

10.times do |user|
  user = User.new(
    email: Faker::Internet.email,
    password: "foobar",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  user.save!
  puts "#{user}"
end

puts "Created #{User.count} users..."


# Creates alpacas
puts 'Creating alpacas...'
names = ["Bill", "Bob", "Fred", "Paco", "Jorge", "Andy", "Sherman"]
colors = ["brown", "camel", "cream", "off-white", "chocolate", "coffee"]
30.times do
  alpaca = Alpaca.new(
    name: names.sample,
    price: rand(50..300),
    color: colors.sample,
    description: Faker::GameOfThrones.quote,
    address: Faker::Address.city,
    age: rand(1..20),
    user: User.all.sample
  )
  alpaca.remote_photo_url = "https://source.unsplash.com/collection/1935696/"
  # sleep(2)
  alpaca.save!
  puts "#{name}"
end

puts "Created #{Alpaca.count} alpacas..."


# Creates bookings
puts 'Creating bookings...'

User.all.each do |user|
  rand(1..10).times do |booking|
    booking = Booking.new(
      start_date: 20181201,
      end_date: 20181202,
      user: user,
      alpaca: Alpaca.all.sample
    )
    booking.save!
    puts "#{booking.id}"
  end
end

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
  "Best day of my life",
  "Great day at the park",
  "Last night an alpaca saved my life",
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
  description: Faker::Hipster.paragraph,
  rating: rand(3..5),
  booking: Booking.all.sample
  )
  review.save!
  puts "#{review.title}"
end

puts "Created #{Review.count} reviews..."
