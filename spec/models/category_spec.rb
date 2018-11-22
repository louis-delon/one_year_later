require 'rails_helper'

RSpec.describe Category, type: :model do

  context "category associations" do
    it { should have_many(:users) }
  end

  context "category validation" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:weigth) }
  end

  context "category persistence" do
    it 'should persist a category' do
      category = Category.create(name: 'test', weigth: 1)
      expect(Category.count).to eq(1)
    end
  end

  context 'category destroy dependance' do
    it 'should destroy users_categories if user is destroyed' do
      user = User.new(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
      category1 = Category.new(name: 'louis', weigth: 1)
      category2 = Category.new(name: 'eric', weigth: 2)
      user.categories += [category1, category2]
      # byebug
      user.save!
      user.destroy
      expect(User.count).to eq(0)
      expect(CategoriesUser.count).to eq(0)
    end
  end

  context 'category persistance' do
    it 'should persist a category' do
      category = Category.create(name: 'louis', weigth: 1)
      expect(Category.count).to eq(1)
    end
  end

end

# it 'should have many users', type: :model do
#   user = User.new(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
#   category = Category.new(name: 'famille', weigth: 1)
#   category.users << user
#   category.save!
#   expect(category.users.count).to eq(1)
#   expect(User.count).to eq(1)
# end

# it "should not be valid without a name" do
#   category = Category.new(name: nil, weigth: 1)
#   expect(category).to_not be_valid
# end

# it "is not valid without a weigth" do
#   category = Category.new(name: "travail", weigth: nil)
#   expect(category).to_not be_valid
# end
