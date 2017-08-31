FactoryGirl.define do

  factory :groups do
    # current_user.groups
    name { Faker::Name.name }
    user
  end
end
