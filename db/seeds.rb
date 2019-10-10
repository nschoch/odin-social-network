# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(first_name: first_name,
              last_name: last_name,
              email: "#{(first_name + last_name).downcase}@example.com",
              password: "password1")
end

(3..10).each do |n|
  RelationshipRequest.create(requester_id: User.first.id, requestee_id: n)
end

Relationship.create(friender: User.first, friendee: User.second)

(1..9).each do |n|
  user = User.find(n)
  3.times do
    content = Faker::TvShows::MichaelScott.quote
    user.posts.create(content: content)
  end
end