require "factory_bot_rails"
require "faker"

FactoryBot.define do
  factory :employee do
    name {Faker::Name.unique.name}
    email {Faker::Internet.email}
    password {'password'}
    role {0}
  end
end
