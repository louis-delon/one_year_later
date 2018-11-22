require 'rails_helper'

RSpec.describe CategoriesUser, type: :model do

  context "associations" do

    it "should belong to category " do
      category = Category.create(name: "travail", weigth: 1)
      user = User.create(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
      category.users << user
      expect(CategoriesUser.all).to_be eq(1)
    end

    it "should belong to user" do
      user = User.create(email: 'louis@holdies.com', password: 'password', username: 'loulou', birthday: '26/12/1977')
      category = Category.create(name: "travail", weigth: 1)
      expect(user.categories_users.count).to_be eq(1)
    end

  end
end
