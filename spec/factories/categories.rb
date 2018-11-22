FactoryBot.define do
  factory :category do
    sequence(:name) { |i| "name#{i}" }
    sequence(:weigth) { |i| i }
  end
end
