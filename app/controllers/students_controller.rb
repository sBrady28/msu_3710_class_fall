class StudentsController < ApplicationController
  before_action :set_student, only: %[show edit update destroy]

  #GET /students or /students.json
def index
    @students = Student.all
    
end
