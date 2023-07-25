# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :block_ips

  rescue_from ActionController::ParameterMissing, with: :bad_request
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

  private

  def block_ips
    black_list_ips = Rails.cache.fetch('black_list_ips') || update_rails_cache

    client_ip = IPAddr.new(request.remote_ip)

    render plain: '귀하의 IP는 차단 되어있습니다.', status: :forbidden if black_list_ips.include?(client_ip)
  end

  def bad_request(exception)
    render json: { error: exception.message }, status: :bad_request
  end

  def unprocessable_entity(exception)
    render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  def update_rails_cache
    black_list_ips = BlackList.all.pluck(:ip_address)
    Rails.cache.write('black_list_ips', black_list_ips)

    black_list_ips
  end
end
