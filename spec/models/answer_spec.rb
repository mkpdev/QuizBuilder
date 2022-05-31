require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject {
    described_class.new(response: "Test")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a response" do
    subject.response = nil
    expect(subject).to_not be_valid
  end

  describe 'validation' do
    it { should validate_presence_of(:response) }
  end

  describe "Associations" do
    it { should belong_to(:quiz) }
    it { should belong_to(:question) }
    it { should belong_to(:user) }
  end
end
