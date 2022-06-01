# frozen_string_literal: true

class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :answers
  validates_presence_of :name
  accepts_nested_attributes_for :questions
end
