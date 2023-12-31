# frozen_string_literal: true

class MainController < ApplicationController
  # Task1: IP가 차단 상태여도 landing_page페이지는 볼수있게한다.
  skip_before_action :block_ips, only: :landing_page

  def landing_page
    pp request.remote_ip
    render plain: 'Welcome Page', status: :ok
  end
end
