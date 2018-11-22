require 'rails_helper'

RSpec.describe User, type: :model do

  context 'User model validation' do
  #L'enregistrement d'un user doit être persisté en base de donnée
    it "is valid with valid attributes" do
      user = build(:user)
      expect(user).to be_valid
    end

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:birthday) }

  end

  context 'User model persistance' do
    it 'should persist a user' do
      create(:user)
      expect(User.count).to eq(1)
    end
  end

  context 'User model associations' do
    it { should have_many(:categories_users).dependent(:destroy) }
    it { should have_many(:categories) }
  end

end

# it "is valid with valid attributes" do
#   user = User.new(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
#   expect(user).to be_valid
# end

# it "isn't valid without a username" do
#   user = User.create(email: 'louis@holdies.com', password: 'password', username: nil, birthday: '26/12/1977')
#   expect(user).to_not be_valid
# end

# it "isn't valid without a birthday" do
#   user = User.create(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: nil)
#   expect(user).to_not be_valid
# end

# it "isn't valid without an email" do
#   user = User.create(email: nil, password: 'password', username: 'loulou', birthday: '26/12/1977')
#   expect(user).to_not be_valid
# end

# it "isn't valid without a password" do
#   user = User.create(email: 'louis@holdies.com', password: nil, username: 'loulou', birthday: '26/12/1977')
#   expect(user).to_not be_valid
# end

# it "should have many categories" do
#   user = User.new(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
#   category = Category.new(name: 'louis', weigth: 1)
#   user.categories << category
#   user.save!
#   expect(user.categories.count).to eq(1)
#   expect(Category.count).to eq(1)
# end
