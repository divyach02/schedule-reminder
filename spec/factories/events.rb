FactoryBot.define do
  factory :event do
    sequence(:title) { |n| "title#{n}" }
    description { 'description' }
    month_day { (1..20).to_a.sample }
    month_direction { %w[start_of_month end_of_month].sample }
    time { Time.parse('2020-01-04 5:30:00') }
    association :user, factory: :user
  end
end
