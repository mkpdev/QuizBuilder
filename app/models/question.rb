# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers
  enum question_type: %i[text textarea].freeze
  validates_presence_of :title, :question_type
  accepts_nested_attributes_for :answers
end
