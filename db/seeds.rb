# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "to create user ..."
u = User.create email: "example@gmail.com", password: "12345678", password_confirmation: "12345678"

20.times do |n|
  g= Group.create title: "title-g#{n}", description: "desc-g#{n}", user_id: u.id

  30.times do |m|
    Post.create content: "content-g#{n}-post#{m}", group_id: g.id, user_id: u.id
  end
end
