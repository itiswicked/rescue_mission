class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order('created_at DESC')
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      flash[:notice] = @question.errors.full_messages
      redirect_to new_question_path
    end
  end


  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

end
