FactoryBot.define do
  factory :action do
    sequence(:title) { |i| "A améliorer avec #{i}" }
    description { "orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad " }
    sequence(:deadline) { |i| "#{i}#{i}/12/2018" }
  end
end
