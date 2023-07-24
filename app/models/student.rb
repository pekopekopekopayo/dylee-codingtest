# frozen_string_literal: true

class Student < ApplicationRecord
  has_many :devices, as: :target, dependent: :destroy
  has_many :teachers, through: :lessons
  has_many :lessons

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
