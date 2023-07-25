# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  validate :lesson_time_validate
  validate :teacher_schdule_validate
  validate :student_schdule_validate

  def notification
    LessonMailer.send_student_reservation_confirmation(self).deliver_now
    LessonMailer.send_teacher_reservation_confirmation(self).deliver_now

    LessonPusherWorker.perform_async(id)
  end

  private

  def lesson_time_validate
    errors.add(:base, '수업시간을 과거로 설정할수없습니다.') if Time.zone.now > started_at
    errors.add(:base, '수업시간이 유효하지 않습니다.') if started_at >= ended_at
  end

  def teacher_schdule_validate
    lesson = Lesson.where(teacher_id:).where('started_at <= ? AND ended_at > ?', ended_at, started_at)
    errors.add(:base, '선생님의 일정이 존재합니다') if lesson.exists?
  end

  def student_schdule_validate
    lesson = Lesson.where(student_id:).where('started_at <= ? AND ended_at > ?', ended_at, started_at)
    errors.add(:base, '학생의 일정이 존재합니다') if lesson.exists?
  end
end
