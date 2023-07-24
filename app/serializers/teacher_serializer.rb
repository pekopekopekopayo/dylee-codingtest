class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :devices
end
