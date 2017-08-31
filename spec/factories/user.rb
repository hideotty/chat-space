FactoryGirl.define do

 pass = Faker::Lorem.sentence

  factory :user do
    name { Faker::Name.name}
    email{ Faker::Internet.email }
    password { pass }
    password_confirmation { pass }
  end
end
