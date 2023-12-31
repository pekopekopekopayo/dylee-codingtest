# frozen_string_literal: true

module StudentService
  class Create < ApplicationService
    def call(params)
      ActiveRecord::Base.transaction do
        student = Student.create!(email: params[:email], name: params[:name])
        student.devices.create!(os: params[:os], token: params[:token])

        student
      end
    end
  end
end
