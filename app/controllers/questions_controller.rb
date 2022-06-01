# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_quiz, only: [:index, :new, :create]
  before_action :set_question, only: [:show, :destroy, :update]

  def index
    @questions = @quiz.questions
  end

  def new
    @question = @quiz.questions.build
  end

  def create
    @question = @quiz.questions.build(question_params)
    if @question.save
      redirect_to quizzes_path, notice: 'Question has been created'
    else
      redirect_to root_path, notice: 'Question has not been created'
    end
  end

  def show; end

  def destroy
    if @question.destroy
      redirect_to quizzes_path, notice: 'Question has been removed'
    else
      redirect_to root_path, notice: 'Question has not been removed'
    end
  end

  private

  def set_quiz
    @quiz = Quiz.find_by_id(params[:quiz_id])
  end

  def set_question
    @question = Question.find_by_id(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :question_type)
  end
end
