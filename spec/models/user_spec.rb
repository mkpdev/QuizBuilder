require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(name: "Test",
                        email: "a@yopmail}",
                        password: '123455',
                        role: 1 )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a role" do
    subject.role = nil
    expect(subject).to_not be_valid
  end

  describe 'validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:role) }
  end

  describe 'associations' do
    it { should have_many(:quizzes) }
    it { should have_many(:answers) }
  end
end
