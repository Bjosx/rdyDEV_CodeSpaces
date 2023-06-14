class StudentsController < ApplicationController
  def index
    @students = Student.paginate(:page => params[:page], :per_page => 10)
  end
end