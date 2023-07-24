class LessonPusherWorker
  include Sidekiq::Worker
  extend AppNotification
  
  def perform(lesson_id)
    lesson = Lesson.find(lesson_id)
    student = lesson.student
    teacher = lesson.teacher

    send_student_notification(student, teacher)
    send_teacher_notification(studnet, teacher)
  end

  private

  def send_student_notification(student, teacher)
    student.devices.each do |device|
      body = {
        message:{
          token: device.token,
          notification: {
            title: "#{teacher.name}선생님의 수업 예약이 완료되었습니다.",
            body: "#{student.name}님 #{lesson.started_at.strftime("%Y년%m월%d일 %H시 %M분")}부터 
                    #{lesson.ended_at.strftime("%Y년%m월%d일 %H시 %M분")}까지 #{teacher.name}선생님의 수업 예약이 완료 되었습니다."
          }
       }
      }

      send_notification(body)
    end
  end

  def send_teacher_notification(student, teacher)
    teacher.devices.each do |device|
      body = {
        message:{
          token: device.token,
          notification: {
            title: "#{teacher.name}선생님의 수업 예약이 완료되었습니다.",
            body: "#{teacher.name}님 #{student.name}님이 #{lesson.started_at.strftime("%Y년%m월%d일 %H시 %M분")}부터 
              #{lesson.ended_at.strftime("%Y년%m월%d일 %H시 %M분")}까지 수업 예약을 하였습니다."
          }
       }
      }

      send_notification(body)
    end
  end
end