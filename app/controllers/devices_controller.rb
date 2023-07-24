class DevicesController < ApplicationController
  before_action :find_user

  def index
    render json: @user
  end

  def create
    device = @user.devices.create!(create_params)

    render json: device, status: :created
  end

  def destroy
    @user.devices.find(params[:id])

    head :ok
  end

  private 

  def create_params
    params.require(:device).permit(:os, :token)
  end

  def find_user
    @user = Student.find(params[:student_id]) || @user = Teacher.find(params[:teacher_id])
  end
end
