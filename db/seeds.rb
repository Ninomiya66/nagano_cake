# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "admin@gmail.com",
  password: "adminadmin"
  )

  Genre.create!(
     name: "ケーキ",
  )

  Genre.create!(
     name: "洋菓子",
  )

  Genre.create!(
     name: "和菓子",
  )

  Genre.create!(
     name: "チョコレート",
  )

  Item.create!(
    genre_id: 1,
    name: "いちごのショートケーキ（ホール）",
    introduction: "こだわり苺を贅沢に使⽤しています。",
    price: 3200,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/whole_cake.png")
  )

  Item.create!(
    genre_id: 4,
    name: "イチゴチョコレート",
    introduction: "こだわったチョコレートを使⽤しています。",
    price: 400,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/chocolate_ichigo.png")
   )

  Item.create!(
    genre_id: 2,
    name: "シュークリーム",
    introduction: "パティシエ特製のおすすめ商品です。",
    price: 150,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/creampuff.png")
  )

  Item.create!(
    genre_id: 3,
    name: "紅葉饅頭",
    introduction: "おすすめ商品です。",
    price: 650,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/momoji_manju.png")
  )

  Item.create!(
    genre_id: 1,
    name: "モンブラン",
    introduction: "おすすめ商品です。",
    price: 320,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/montblanc.png")
  )