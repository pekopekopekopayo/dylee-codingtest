class BlackList < ApplicationRecord
  validates :ip_address, presence: true, uniqueness: true
end