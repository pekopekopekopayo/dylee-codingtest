# frozen_string_literal: true

module RailsCacheService
  module BlackListService
    class Update < ApplicationService
      def call
        pp BlackList
        black_list_ips = BlackList.all.pluck(:ip_address)
        Rails.cache.write('black_list_ips', black_list_ips)

        black_list_ips
      end
    end
  end
end
