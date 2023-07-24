# frozen_string_literal: true

class Device < ApplicationRecord
  belongs_to :target, polymorphic: true

  enum os: { android: 0, apple: 1 }

  # NOTE: Rails에서는 enum의 타입이 이상 할 경우 agrument_error(500)가 발생 됩니다. 이 부분은 핸들링을 따로 할 수있으나 생략합니다.
  # validates :os, inclusion: { in: os.keys }
end
