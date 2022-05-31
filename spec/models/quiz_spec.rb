require 'rails_helper'

RSpec.describe Quiz, type: :model do
  subject {
    described_class.new(name: "test-quiz")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  describe 'validation' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:questions) }
    it { should have_many(:answers) }
  end
end
