class StudentsController < ApplicationController
  PER_PAGE = 10
  def index
    @students = Student.paginate(page: params[:page], per_page: PER_PAGE)
  end
end