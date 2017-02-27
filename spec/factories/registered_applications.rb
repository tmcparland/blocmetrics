FactoryGirl.define do
    factory :registered_application do
        
        name Faker::Pokemon.name
        url Faker::Internet.url
        user
    end
end
