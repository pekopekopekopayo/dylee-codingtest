class Lesson < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  validate :teacher_schdule_validate
  validate :student_schdule_validate

  def notification
    LessonMailer.send_student_reservation_confirmation(lesson).deliver_now
    LessonMailer.send_teacher_reservation_confirmation(lesson).deliver_now
    
    LessonPusherWorker.perform_async(lesson.id)
  end

  private
  
  def teacher_schdule_validate
    lesson = Lesson.where(teacher_id: teacher_id).where("started_at <= ? AND ended_at > ?", ended_at, started_at)
    errors.add(:base, "선생님의 일정이 존재합니다") if lesson.exists?
  end

  def student_schdule_validate
    lesson = Lesson.where(student_id: student_id).where("started_at <= ? AND ended_at > ?", ended_at, started_at)
    errors.add(:base, "학생의 일정이 존재합니다") if lesson.exists?
  end
end
