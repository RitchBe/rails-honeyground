require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Cleaning database...'
Sale.destroy_all

Product.destroy_all

User.destroy_all


USERCATEGORY = ["User", "Seller"]

puts 'Creating 30 fake Users...'
30.times do
  User.create(
    email: Faker::Internet.email,
    password: "password",
    name:Faker::Name.name,
    nickname: Faker::Twitter.screen_name,
    address: Faker::Address.street_address(include_secondary = "Lisbon"),
    category: USERCATEGORY.sample,
    since: (1970..2017).to_a.sample,
    hives: (50..200).to_a.sample,
    validation: "Uncheck"
  )
end

HONEYNAME = ["RichyHony","MezquirizGlamour","GonyPonny","HugoBesugo","HoneyLove","MoistHoney"]

puts 'Creating 10 fake Products ...'
30.times do
  product = Product.create(
    name: HONEYNAME.sample,
    price: (20..150).to_a.sample,
    user_id: User.all.sample.id,
    description: Faker::Beer.style,
    validation: "Uncheck",
    category: Product::CATEGORIES.sample,
    year: 2016
  )

  url = "https://picsum.photos/200/300/?random"
  product.photo_url = url # Upload happens here
  product.save
end


STATUS = ["On it´s way", "Confirmed", "Pending acceptance", "Order awaiting to be confirmed"]

puts 'Creating 30 fake Sales ...'
30.times do
  Sale.create(
    user_id: User.all.sample.id,
    product_id: Product.all.sample.id,
    tracking_number: (0..100000).to_a.sample,
    status: STATUS.sample,
  )
end

puts 'Finished!'
