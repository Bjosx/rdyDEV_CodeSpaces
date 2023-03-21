require 'faker'
#factory for creating an example student. using nested factory to try and follow best practice as outlined here: https://github.com/thoughtbot/factory_bot/blob/main/GETTING_STARTED.md#best-practices
FactoryBot.define do
    factory :student do
        factory :student_with_data do
            title { Faker::Name.prefix }
            first_name { Faker::Name.first_name }
            middle_name { Faker::Name.middle_name }
            last_name { Faker::Name.last_name }
            email { Faker::Internet.email }
            birth_date { Faker::Internet.email }
            gender { Faker::Gender.binary_type }
        end
    end
end