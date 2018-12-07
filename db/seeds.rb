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

colors =
  ["brown", "camel", "cream", "off-white", "chocolate", "coffee"]

# Creates users
puts 'Creating users...'

n_users = 10
n_alpacas = 18
n_bookings = n_alpacas * 5

# Creates test user
user = User.new(
  email: "all@packer.com",
  password: "foobar",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
  )
user.save!

n_users.times do |user|
  user = User.new(
    email: Faker::Internet.email,
    password: "foobar",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  user.save!
  # puts "#{user}"
end

puts "Created #{User.count} users..."

# Creates alpacas
puts 'Creating alpacas...'
# names = ["Bill", "Bob", "Fred", "Paco", "Jorge", "Andy", "Sherman"]
n_alpacas.times do
  alpaca = Alpaca.new(
    name: Faker::Name.first_name,
    price: rand(50..300),
    color: colors.sample,
    description: Faker::GameOfThrones.quote,
    address: "Lisbon",
    age: rand(1..20),
    user: User.all.sample
  )
  alpaca.remote_photo_url = "https://source.unsplash.com/collection/1935696/"
  alpaca.save!
  puts "#{alpaca.name}"
end

puts "Created #{Alpaca.count} alpacas..."


# Creates 100 bookings with reviews
puts 'Creating bookings...'

n_bookings.times do |booking|
  booking = Booking.new(
    start_date: 20181201,
    end_date: 20181202,
    user: User.all.sample,
    alpaca: Alpaca.all.sample
  )
  booking.save!
  # puts "#{booking}"

  review = Review.new(
    title: titles.sample,
    description: "#{Faker::Hipster.paragraph},
                  #{Faker::Hipster.paragraph},
                  #{Faker::Hipster.paragraph}",
    rating: rand(3..5),
    booking: booking
    )
  review.save!
  # puts "#{review.title}"
end

puts "Created #{Booking.count} bookings..."
