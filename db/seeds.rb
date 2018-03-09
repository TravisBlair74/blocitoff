10.times do
  User.create([{
    email: Faker::Internet.email,
    password: Faker::Seinfeld.character
    }])
end
users = User.all

50.times do
  Item.create([{
    name: Faker::LordOfTheRings.character,
    user_id: users.sample.id
    }])
end
items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
