require 'rails_helper'

RSpec.describe Category, type: :model do

  it "is not valid without a name" do
   category = Category.new(name: nil, weigth: 1)
   expect(category).to_not be_valid
  end

  it 'should persist a category' do
    Category.create(name: 'test', weight: 1)
    expect Category.count.to(eq(1))
  end

  it 'should have association with category table', type: :model do
    user = User.create(email: 'louis@holdies.com', password: 'password', username: 'loulou')
    category1 = Category.create(name: 'louis', weigth: 1)
    category2 = Category.create(name: 'delon', weigth: 2)
    expect (user.categories).to be_an_instance_of(Array)
    expect (user.categories.count).to eq(2)
  end

  it 'should destroy categories if user is destroyed' do
    user = User.create(email: 'louis@holdies.com', password: 'password', username: 'loulou')
    category1 = Category.create(name: 'louis', weigth: 1)
    category2 = Category.create(name: 'delon', weigth: 2)
    user.destroy
    expect(category1).to be_nil
    expect(category2).to be_nil
  end

end
