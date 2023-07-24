# frozen_string_literal: true

class LessonSerializer < ActiveModel::Serializer
  attributes :id, :student_id, :teacher_id, :started_at, :ended_at
end
