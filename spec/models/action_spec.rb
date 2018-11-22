require 'rails_helper'

RSpec.describe Action, type: :model do
  context "action associations" do
    it { should belong_to(:objective) }
  end

  context "action validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:deadline) }
  end

  context "action persistence" do
    it 'should persist a action' do
      category = build(:category)
      state = build(:state)
      objective = build(:objective)
      action = build(:action)
      category.states << state
      state.objectives << objective
      objective.actions << action
      category.save!
      expect(Action.count).to eq(1)
    end
  end
end
