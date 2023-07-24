# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    students = Student.all

    render json: students
  end

  def create
    student = StudentService::Create.call(create_params)

    render json: student, status: :created
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy

    head :ok
  end

  private

  def create_params
    params.require(:student).permit(:name, :email, :os, :token)
  end
end
