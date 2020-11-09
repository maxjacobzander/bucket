# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
# BucketList.destroy_all
# Goal.destroy_all

3.times do
    User.create(name: Faker::JapaneseMedia::DragonBall.character,
        email: Faker::Internet.email,
        password: "password")
end
# 10.times do
#     BucketList.create(name: "My Bucket",
#         bucket_lists_user_id: rand(1..3)
#     )
# end
# 10.times do
#     Goal.create(name: "Visit every state in the USA",
#     user_id: rand(1..3),
#     bucket_list_id: rand(1..3))
# end