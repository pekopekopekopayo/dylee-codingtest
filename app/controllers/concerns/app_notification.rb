# frozen_string_literal: true

module AppNotification
  def send_notification(body)
    # url = "https://fcm.googleapis.com/v1/projects/#{ENV["FCM_PROJECT_ID"]}/messages:send"
    # conn = Faraday.new(url: url)

    # response = conn.post do |req|
    #   req.headers['Content-Type'] = 'application/json'
    #   req.headers['Authorization'] = "Bearer " + access_token["access_token"].to_s
    #   req.body = body.to_json
    # end

    p body
  end
end
