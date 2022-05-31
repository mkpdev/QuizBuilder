class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :answers
  validates_presence_of :name
end
