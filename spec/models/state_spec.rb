require 'rails_helper'

RSpec.describe State, type: :model do

  context "state associations" do
    it { should belong_to(:category) }
    it { should have_many(:objectives).dependent(:destroy) }
  end

  context "state validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:note) }
    it { should validate_presence_of(:date) }
  end

  context "state persistence" do
    it 'should persist a state' do
      category = build(:category)
      state = build(:state)
      category.states << state
      category.save!
      expect(State.count).to eq(1)
    end
  end

end
