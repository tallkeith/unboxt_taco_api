FactoryBot.define do
  factory :taco do
    meat { 'steak' }
    rice { true }
    salsa { false }
    note { 'Fake Note' }
  end

  trait :chicken_taco do
    meat { 'chicken' }
  end

  trait :no_note do
    note { nil }
  end
end
