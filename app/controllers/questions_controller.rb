class QuestionsController < ApplicationController
  before_action :find_survey
  DEFAULT_ANSWER_COUNT = 3

  def new
    @question = Question.new
    DEFAULT_ANSWER_COUNT.times { @question.answers.build }
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
    params.require(:question).permit(:title,
                                     answers_attributes: [:body, :id, :_destroy])
  end
end
