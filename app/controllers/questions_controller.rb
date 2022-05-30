class QuestionsController < ApplicationController
  def index
  end

  def new
    @question = Quiz.find_by_id(params[:quiz_id]).questions.new
  end

  def create
    @question = Quiz.find_by_id(params[:quiz_id]).questions.create(question_params)
    if @question.save
      redirect_to quizzes_path, notice: 'Question has been created'
    else
      redirect_to root_path, notice: 'Question has not been created'
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :question_type)
  end
end
