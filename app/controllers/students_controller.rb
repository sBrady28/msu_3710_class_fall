# This code was added 03Oct2024 added new params to both methods below. check later  SLB
class StudentsController < ApplicationController
  # This action retrieves all students and assigns them to @students
  def index
    @students = Student.all
  end

  # This action initializes a new Student object
  def new
    @student = Student.new
  end

  # This action creates a new student with the provided parameters
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  private

  # This method specifies the permitted parameters for a student when creating the object
  def student_params
    params.require(:student).permit(:name, :school_email, :major, :minor, :graduation_date)
  end
end