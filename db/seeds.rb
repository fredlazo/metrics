require 'faker'

user = User.create!(
  email: 'fredlazo@yahoo.com', # replace this with your personal email
  password: 'password'
)

5.times do
  User.create!(

  email:    Faker::Internet.email,
  password: "password"
  )
end
users = User.all

#Create Apps
5.times do
  App.create!(
    name: Faker::App.name,
    url:  Faker::Internet.url,
    user: users.sample
  )
end
apps = App.all

#Create Events
150.times do
  Event.create!(
    app: apps.sample,
    name: Faker::Hacker.verb
  )
end

events = Event.all


puts "Seed finished"
puts "#{User.count} users created"
puts "#{App.count} applications created"
puts "#{Event.count} events created"
