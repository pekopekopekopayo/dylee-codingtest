# frozen_string_literal: true

class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :os, :token
end
