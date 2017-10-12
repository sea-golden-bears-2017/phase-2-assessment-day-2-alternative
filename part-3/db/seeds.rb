require 'faker'

User.create(username: "blaine", email:
"blaine", password: "blaine")

Potluck.create(name: "This is the one!", location: "Best place ever!", date_at: "#{rand(10)}#{rand(10)}#{rand(10)}#{rand(10)}-#{rand(10)}#{rand(10)}-#{rand(10)}#{rand(10)}", time_at: "0#{rand(9)}:#{rand(5)}#{rand(9)}", user_id: 1)

9.times do
  User.create(username: Faker::Pokemon.unique.name, email: Faker::Internet.unique.email, password: Faker::Internet.password)
end

5.times do
  Potluck.create(name: Faker::Food.unique.dish, location: Faker::ElderScrolls.region, date_at: "#{rand(10)}#{rand(10)}#{rand(10)}#{rand(10)}-#{rand(10)}#{rand(10)}-#{rand(10)}#{rand(10)}", time_at: "0#{rand(9)}:#{rand(5)}#{rand(9)}", user: User.all.sample)
end
