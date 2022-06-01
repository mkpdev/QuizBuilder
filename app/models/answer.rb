# frozen_string_literal: true
class Answer < ApplicationRecord
  belongs_to :quiz
  belongs_to :question
  belongs_to :user
  validates_presence_of :response
end
