FactoryGirl.define do
  factory :user do
    # name { Faker::Pokemon.name }
    email Faker::Internet.free_email
    password = Faker::Internet.password(6)
    password password
    password_confirmation password
  end
end
