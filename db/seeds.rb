# Mentor login
User.create!(
  email: 'mentor@analytics.com',
  password: 'helloworld',
  confirmed_at: '2016-08-21'
)

# Create Users
10.times do
  User.create!(

  email:    Faker::Internet.email,
  password: Faker::Internet.password(8)
  )
end
users = User.all

# Create applications
50.times do
   RegisteredApplication.create!(
     name: Faker::Pokemon.name,
     url: Faker::Internet.url,
     user: users.sample
   )
 end

registered_applications = RegisteredApplication.all

#Create Events 
100.times do
  Event.create!(
    name: Faker::Hipster.word,
    registered_application: registered_applications.sample
  )
end

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{RegisteredApplication.count} applications created"
 puts "#{Event.count} events created"
