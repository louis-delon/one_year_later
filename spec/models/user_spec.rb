require 'rails_helper'

RSpec.describe User, type: :model do

  # L'enregistrement d'un user doit être persisté en base de donnée
  it 'should persist a user', type: :model do
    User.create(email: 'louis@holdies.com', password: 'password')
    expect(User.count).to eq(1)
  end

  # Un user has many Users_category
  it 'should have association with category table', type: :model do
    user = User.create(email: 'louis@holdies.com', password: 'password')
    category = Category.create(name: 'louis', weigth: 1)
    expect (user.categories).to be_an_instance_of(Array)
    expect (user.categories.count).to eq(1)

  end
  # La suppression d'un user entraîne la suppression de ses UserCategory
  # Un user doit avoir un email, une date de naissance et un pseudo
end


# require 'rails_helpers'

# RSpec.describe Category, type: :model do
#   it 'should persist a category' do
#     Category.create(name: 'test', weight: 1)
#     expect Category.count.to(eq(1))
# end
