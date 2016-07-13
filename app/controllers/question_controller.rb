class QuestionController < ApplicationController
  def index
  	@questions = Questions.all
  end

  def show
  	@question = Question.find(params[:id])
  end

  def new
  	@questions = Question.new
  end

  def create
  	@question = Question.new(params.require(:question),permit(:title, :body, :resolved))
  	if @questions.save
  		flash[:notice] = "Questions was saved."
  		redirect_to @question
  	else
  		flash[:error] = "There was an error saving the question. Please try again."
  		render :new
  	end
  end

  def edit
  	@question = Question.find(params[:id])
  end

  def update
  	@question = Quetion. find(params[:id])
  	if @question.update_attributes(params.require(:question).permit(:title, "body, :resolved"))
  		flash[:notice] = "Question was updated."
  		redirect_to @question
  	else
  		flash[:error] = "There was an error saving the question. Plesae try again."
  		render :edit
  	end
  end
  def destroy
  	@question = Question.find(params[:id])

  	if @question.destroy
  		flash[:notice] = "\"#{@question.title}\" was deleted successfully."
  		redirect_to questions_path
  	else
  		flash[:error] = "There was an error deleting the question."
  	end
  end

end









