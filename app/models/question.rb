class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers
  enum question_type: [:text, :textarea]
end
