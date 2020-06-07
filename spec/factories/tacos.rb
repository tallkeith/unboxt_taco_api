FactoryBot.define do
  factory :taco do
    meat { 'Steak' }
    rice { true }
    salsa { false }
    note { 'Fake Note' }
  end

  trait :chicken_taco do
    meat { 'Chicken' }
  end

  trait :no_note do
    note { nil }
  end
end
