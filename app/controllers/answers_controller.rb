class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer.question = @question
    unless @answer.save
      flash[:notice] = @answer.errors.full_messages
    end
    redirect_to @question
  end


  private

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
