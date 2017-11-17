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
ADDRESSES = ["Av. Duque de Ávila 201, 1050-082 Lisboa",
  "Av. dos Cavaleiros 20, 2790-045 Carnaxide",
  "Largo Girassol 26, 2775-417 Carcavelos",
  "Praça dos Pescadores 42, 2825 Costa da Caparica",
  "Tv. São Domingos de Benfica 13, Lisboa",
  "AVENIDA REI HUMBERTO II DE ITÁLIA, LISBOA, BOCA DO INFERNO, 2750-800 Cascais",
  "Av. Rei Humberto II de Italia 7, 2750-800 Cascais",
  "R. Gurué 16, 2775-581 Carcavelos",
  "Quinta da Beloura, Rua Mato da Mina, nº19, 2710-692 Sintra",
  "Alto do Pragal, Av. Cristo Rei, 2800-058 Almada",
  "Praia Das Palmeiras, São João,Costa De Caparica, 2825-426 Almada",
  "R. Parque Infantil 1, 2825-328 Costa da Caparica",
  "Av. de Roma 50, 1700-348 Lisboa",
  "Jardim Zoológico de Lisboa, Estr. de Benfica 1549, 1500-423 Lisboa",
  "Rotunda Nuno Rodrigues dos Santos, 2685-220 Portela",
  "R. Me. Deus 4, 1900-312 Lisboa",
  "R. Amorim 2, 1950-022 Lisboa",
  "Praça Duque da Terceira 24, 1200-014 Lisboa"
 ]

puts 'Creating 16 fake Users...'
16.times do
  User.create(
    email: Faker::Internet.email,
    password: "password",
    name:Faker::Name.name,
    nickname: Faker::Twitter.screen_name,
    address: ADDRESSES.sample,
    category: USERCATEGORY.sample,
    since: (1970..2017).to_a.sample,
    hives: (50..200).to_a.sample,
    validation: "Uncheck"
  )
end

HONEYNAME = ["Comb honey",
  "Liquid honey",
  "Granulated honey",
  "Creamed honey",
  "HoneyLove",
  "MoistHoney",
  "Creamed honey",
  "Raw",
  "Pasteurized",
  "Alfalfa",
  "Advocado",
  "Blueberry",
  "Buckwheat",
  "Clover"
]

puts 'Creating 10 fake Products ...'
10.times do
  product = Product.create(
    name: HONEYNAME.sample,
    price: (20..150).to_a.sample,
    user_id: User.all.sample.id,
    description: Faker::Beer.style,
    validation: "Uncheck",
    category: Product::CATEGORIES.sample,
    year: (2007..2017).to_a.sample
  )

  url = "https://picsum.photos/200/300/?random"
  product.photo_url = url # Upload happens here
  product.save
end


STATUS = ["On it´s way", "Confirmed", "Unpaid", "Pending acceptance", "Delivering"]

puts 'Creating 16 fake Sales ...'
16.times do
  Sale.create(
    user_id: User.all.sample.id,
    product_id: Product.all.sample.id,
    tracking_number: (0..100000).to_a.sample,
    status: STATUS.sample,
  )
end

puts 'Finished!'
