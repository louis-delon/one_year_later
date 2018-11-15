require 'rails_helper'

RSpec.describe User, type: :model do

  # L'enregistrement d'un user doit être persisté en base de donnée
  it "is valid with valid attributes" do
    user = User.new(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
    expect(user).to be_valid
  end

  it "isn't valid without valid username" do
    user = User.new(email: 'louis@holdies.com', password: 'password', username: nil, birthday: '26/12/1977')
    expect(user).to_not be_valid
  end

  it "isn't valid without valid birthday" do
    user = User.new(email: 'louis@holdies.com', password: 'password', username: nil, birthday: nil)
    expect(user).to_not be_valid
  end

  it 'should persist a user' do
    User.create(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
    expect(User.count).to eq(1)
  end
end



