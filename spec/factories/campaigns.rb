# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:random_string) { |n| "Random String #{n}" }
  factory :campaign do
    info { generate(:random_string) }
    time_start { Time.now }
    time_end { Time.now }
  end
end
