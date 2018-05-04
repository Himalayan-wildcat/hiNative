FactoryGirl.define do
  factory :user do
    name Faker::Internet.user_name(1..12)
    sequence :email do |n|
      "test#{n}@gmail.com"
  end
    password = Faker::Internet.password(6)
    password password
    password_confirmation password
  end
end
