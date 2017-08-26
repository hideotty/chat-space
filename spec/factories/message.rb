FactoryGirl.define do

  factory :message do
    content { Faker::Lorem.sentence }
    img Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/sample.jpg'))
    group
    user
  end
end
