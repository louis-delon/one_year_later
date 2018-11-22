require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validation' do
  # L'enregistrement d'un user doit être persisté en base de donnée
    it "is valid with valid attributes" do
      user = User.new(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
      expect(user).to be_valid
    end

    it "isn't valid without a username" do
      user = User.create(email: 'louis@holdies.com', password: 'password', username: nil, birthday: '26/12/1977')
      expect(user).to_not be_valid
    end

    it "isn't valid without a birthday" do
      user = User.create(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: nil)
      expect(user).to_not be_valid
    end

    it "isn't valid without an email" do
      user = User.create(email: nil, password: 'password', username: 'loulou', birthday: '26/12/1977')
      expect(user).to_not be_valid
    end

    it "isn't valid without a password" do
      user = User.create(email: 'louis@holdies.com', password: nil, username: 'loulou', birthday: '26/12/1977')
      expect(user).to_not be_valid
    end

  end

  context 'persistance' do
    it 'should persist a user' do
      User.create(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
      expect(User.count).to eq(1)
    end
  end

  context 'associations' do
    it "should have many users_categories" do


    end

    it "should have many categories" do
      user = User.new(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
      category = Category.new(name: 'louis', weigth: 1)
      user.categories << category
      user.save!
      expect(user.categories.count).to eq(1)
      expect(Category.count).to eq(1)
    end
  end

end



