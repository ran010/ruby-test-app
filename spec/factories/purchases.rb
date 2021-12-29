FactoryBot.define do
  factory :purchase do
    notes {Faker::Lorem.sentence}
    employee
  end
end



