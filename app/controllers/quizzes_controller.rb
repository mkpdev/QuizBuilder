# frozen_string_literal: true

class QuizzesController < ApplicationController
  before_action :authenticate_admin!, except: [:index]

  def index
    if current_user.admin?
      @quizzes = current_user.quizzes
    else
      @quizzes = Quiz.all
    end
  end

  def new
    @quiz = current_user.quizzes.new
    @question = @quiz.questions.new
  end

  def create
    @quiz = current_user.quizzes.create(quiz_params)
    if @quiz.save
      redirect_to quizzes_path, notice: 'Quiz has been created'
    else
      redirect_to root_path, notice: 'Quiz has not been created'
    end
  end

  def destroy
    quiz = Quiz.find_by_id(params[:id])
    if quiz.destroy
      redirect_to quizzes_path, notice: 'Quiz has been deleted'
    else
      redirect_to root_path, notice: 'Quiz has not been deleted'
    end
  end

  def quiz_result
    @quiz = Quiz.find_by_id(params[:quiz_id])

    @results = @quiz.questions.map do |question|
                  [question.title, question.answers.map(&:response).join(',')]
               end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name, questions_attributes: [:title, :question_type])
  end
end
