FactoryBot.define do
  factory :user do
    sequence(:username) { |i| 'username#{i}' }
    sequence(:password) { |i| 'password#{i}' }
    sequence(:email) { |i| 'person#{i}@test.com' }
    sequence(:birthday) { |i|'#{i}/12/1977' }
  end
end


