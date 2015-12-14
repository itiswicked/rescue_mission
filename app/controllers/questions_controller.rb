class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order('created_at DESC')
  end

  def show
    # binding.pry
    @question = Question.find(params[:id])
  end

end
