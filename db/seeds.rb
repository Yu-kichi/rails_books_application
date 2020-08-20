# frozen_string_literal: true

50.times do |n|
  title = Faker::Book.title
  author = Faker::Book.author
  Book.create!(title: title,
               memo: "#{n+1}冊目楽しいなあ〜",
               author: author,
               picture: nil,
               )
end

10.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  address = Faker::Address.city
  User.create!(name: name,
               introduction: "#{name}ですよろしく！",
               email: email,
               address: address,
               zip_code: 21345678,
               password: "password"
               )
end
