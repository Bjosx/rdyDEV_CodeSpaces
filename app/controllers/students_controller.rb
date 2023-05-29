class StudentsController < ApplicationController
  def index
    @students = Student.paginate(page: params[:page], per_page: 10)
  end
  def show
    @student = Student.find(params[:id])
  end
  def edit
    @student = Student.find(params[:id])
  end
end