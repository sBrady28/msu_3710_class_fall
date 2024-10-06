class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # Other actions (show, edit, update, destroy) should be defined here

  private

  def set_student
    @student = Student.find(params[:id])
  end
end