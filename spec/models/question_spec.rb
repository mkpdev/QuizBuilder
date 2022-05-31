require 'rails_helper'

RSpec.describe Question, type: :model do
  subject {
    described_class.new(title: "Test",
                        question_type: 1)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a question_type" do
    subject.question_type = nil
    expect(subject).to_not be_valid
  end

  describe 'validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:question_type) }
  end

  describe 'associations' do
    it { should belong_to(:quiz) }
    it { should have_many(:answers) }
  end
end
