# frozen_string_literal: true

class Teacher < ApplicationRecord
  has_many :devices, as: :target
  has_many :students, through: :teachers
  has_many :lessons

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
