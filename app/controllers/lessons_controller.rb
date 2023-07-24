# frozen_string_literal: true

class LessonsController < ApplicationController
  # Task2: 학생과 선생의 수업시간이 비어있는지 확인하고 Lesson을 생성한다.(Model Validation확인)
  # Task3: 수업이 생성되었으면 학생과 선생에게 알림용 메일을 발신한다.(학생도 메일 발신하는 내용 추가)
  def create
    lesson = Lesson.create!(create_params)
    lesson.notification

    render json: lesson, status: :created
  end

  private

  def create_params
    params.require(:lesson).permit(:student_id, :teacher_id, :started_at, :ended_at)
  end
end
