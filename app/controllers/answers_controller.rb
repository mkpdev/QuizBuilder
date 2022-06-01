# frozen_string_literal: true
# controllers/answers_controller.rb
class AnswersController < ApplicationController
  before_action :set_question, only: %i[new create]

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user_id = current_user.id
    @answer.quiz_id = params[:quiz_id]
    if @answer.save
      redirect_to quiz_questions_path(quiz_id: params[:quiz_id]), notice: 'answer created'
    else
      redirect_to root_path, notice: 'answer has not been created'
    end
  end

  private

  def set_question
    @question = Question.find_by_id(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:response, :question_id)
  end
end
