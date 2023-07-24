# frozen_string_literal: true

class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :devices
end
