class QuizzesController < ApplicationController
  
  def index
    @quizzes = current_user.quizzes
  end

  def new
    @quiz = current_user.quizzes.new
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
  
  private
    def quiz_params
      params.require(:quiz).permit(:name)
    end
end
