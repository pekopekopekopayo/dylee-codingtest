# frozen_string_literal: true

class LessonMailer < ApplicationMailer
  # 한 메일러에서 두가지의 메일이 보내지지 않으므로 메소드를 분리함
  def send_student_reservation_confirmation(lesson)
    student = lesson.student
    teacher = lesson.teacher

    mail(to: student.email, subject: "#{teacher.name}선생님의 수업 예약이 완료되었습니다.",
         body: "#{student.name}님 #{lesson.started_at.strftime('%Y년%m월%d일 %H시 %M분')}부터
      #{lesson.ended_at.strftime('%Y년%m월%d일 %H시 %M분')}까지 #{teacher.name}선생님의 수업 예약이 완료 되었습니다.")
  end

  def send_teacher_reservation_confirmation(lesson)
    student = lesson.student
    teacher = lesson.teacher

    mail(to: teacher.email, subject: "#{student.name}님께서 수업 예약을 하셨습니다.",
         body: "#{teacher.name}님 #{student.name}님이 #{lesson.started_at.strftime('%Y년%m월%d일 %H시 %M분')}부터
      #{lesson.ended_at.strftime('%Y년%m월%d일 %H시 %M분')}까지 수업 예약을 하였습니다.")
  end
end
