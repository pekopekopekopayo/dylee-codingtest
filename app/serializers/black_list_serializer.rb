# frozen_string_literal: true

class BlackListSerializer < ActiveModel::Serializer
  attributes :id, :name, :ip_address
end
