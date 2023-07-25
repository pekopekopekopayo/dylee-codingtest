# frozen_string_literal: true

class BlackList < ApplicationRecord
  validates :ip_address, presence: { message: 'IP가 유효하지 않습니다.' }
  validates :ip_address, uniqueness: true
end
