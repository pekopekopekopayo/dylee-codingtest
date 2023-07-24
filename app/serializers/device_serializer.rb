class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :os, :token
end