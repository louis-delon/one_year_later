require 'rails_helper'

RSpec.describe Category, type: :model do

  context "association and validations" do

    it 'should have association with category table', type: :model do
      user = User.new(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
      category = Category.new(name: 'louis', weigth: 1)
      user.categories << category
      user.save!
      expect(user.categories.count).to eq(1)
      expect(Category.count).to eq(1)
    end

    it "is not valid without a name" do
      user = User.create(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
      category = Category.new(name: nil, weigth: 1)
      user.categories << category
      category.save
      expect(category).to_not be_valid
    end

    it "is not valid without a weigth" do
      user = User.new(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
      category = Category.new(name: "travail", weigth: nil)
      user.categories << category
      user.save
      expect(category).to_not be_valid
    end

    it 'should persist a category' do
      user = User.new(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
      category = Category.new(name: 'test', weigth: 1)
      user.categories << category
      user.save!
      expect(Category.count).to eq(1)
    end

    it 'should destroy categories if user is destroyed' do
      user = User.new(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
      category1 = Category.new(name: 'louis', weigth: 1)
      category2 = Category.new(name: 'louis', weigth: 1)
      user.categories += [category1, category2]
      user.save!
      user.destroy
      expect(User.count).to eq(0)
      expect(Category.count).to eq(0)
    end
  end
end
