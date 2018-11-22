require 'rails_helper'

RSpec.describe CategoriesUser, type: :model do

  context "categories_user associations" do

    it { should belong_to(:user) }
    it { should belong_to(:category) }

  end
end
