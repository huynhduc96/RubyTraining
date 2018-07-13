User.create!(name:  "Duclh",
             email: "ducro09@gmail.com",
             password:              "12345678",
             password_confirmation: "12345678",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "12345678"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
