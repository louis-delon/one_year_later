require 'rails_helper'

RSpec.describe Objective, type: :model do
  context "objective associations" do
    it { should belong_to(:state) }
    it { should have_many(:actions).dependent(:destroy) }
  end

  context "objective validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:deadline) }
  end

  context "objective persistence" do
    it 'should persist a objective' do
      category = build(:category)
      state = build(:state)
      objective = build(:objective)
      category.states << state
      state.objectives << objective
      category.save!
      expect(Objective.count).to eq(1)
    end
  end
end
