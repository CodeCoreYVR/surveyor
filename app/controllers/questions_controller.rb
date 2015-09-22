class QuestionsController < ApplicationController
  before_action :find_survey

  def new
    @question = Question.new
  end

  def create
    @question        = Question.new question_params
    @question.survey = @survey
    if @question.save
      redirect_to @survey, notice: "Question created!"
    else
      render :new
    end
  end

  private

  def find_survey
    @survey = Survey.find params[:survey_id]
  end

  def question_params
    params.require(:question).permit(:title)
  end
end
