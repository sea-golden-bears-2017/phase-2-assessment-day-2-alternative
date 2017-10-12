require 'faker'

User.create(username: "blaine", email:
"blaine", password: "blaine")

9.times do
  User.create(username: Faker::Pokemon.unique.name, email: Faker::Internet.unique.email, password: Faker::Internet.password)
end

5.times do
  Potluck.create(name: Faker::Food.unique.dish, location: Faker::ElderScrolls.region, date_at: "#{rand(10)}#{rand(10)}#{rand(10)}#{rand(10)}-#{rand(10)}#{rand(10)}-#{rand(10)}#{rand(10)}", time_at: "#{rand(10)}#{rand(10)}:#{rand(10)}#{rand(10)}", user_id: rand(10))
end
