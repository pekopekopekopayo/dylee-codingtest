# frozen_string_literal: true

class TeachersController < ApplicationController
  def index
    teachers = Teacher.all

    render json: teachers
  end

  def create
    teacher = TeacherService::Create.call(create_params)

    render json: teacher, status: :created
  end

  def destroy
    Teacher.find(params[:id])

    head :ok
  end

  private

  def create_params
    params.require(:teacher).permit(:name, :email, :os, :token)
  end
end
