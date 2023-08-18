# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email  { Faker::Internet.email }
    document_number { Faker::IDNumber.brazilian_citizen_number(formatted: true) }
    password { Faker::Internet.password }
  end
end
