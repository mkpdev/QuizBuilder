class UsersController < ApplicationController
  before_action :set_quiz, only: [:question_list]

  def quiz_list
    @quizzes = Quiz.all
  end

  def question_list
    @questions = @quiz.questions
  end


  private

  def set_quiz
    @quiz = Quiz.find_by_id(params[:quiz_id])
  end
end
