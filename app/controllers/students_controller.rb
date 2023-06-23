class StudentsController < ApplicationController
  def index
    @students = Student.paginate(page: params[:page], per_page: PER_PAGE)
  end
end