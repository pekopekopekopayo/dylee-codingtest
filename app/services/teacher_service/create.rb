class TeacherService::Create < ApplicationService
  def call(params)
    ActiveRecord::Base.transaction do
      teacher = Teacher.create!(email: params[:email], name: params[:name])
      teacher.devices.create!(os: params[:os], token: params[:token])
      
      teacher
    end
  end
end