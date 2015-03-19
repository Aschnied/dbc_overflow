class QuestionsController < ApplicationController


  def index
    @questions = Question.all
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def upvote
    @question = Question.find(params[:id])
    @question.increment!(:upvote)
    @question.increment!(:score)
    # redirect_to questions_path
    render json: @question
    @question.save
  end

  def downvote
    @question = Question.find(params[:id])
    @question.decrement!(:downvote)
    @question.decrement!(:score)
    # redirect_to questions_path
    render json: @question #not quite sure WHY this helps
    @question.save #not quite sure if this helps
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:title, :text)
    end
end
