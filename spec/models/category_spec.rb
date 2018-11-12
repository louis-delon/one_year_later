require 'rails_helpers'

RSpec.describe Category, type: :model do
  it 'should persist a category' do
    Category.create(name: 'test', weight: 1)
    expect Category.count.to(eq(1))
end
