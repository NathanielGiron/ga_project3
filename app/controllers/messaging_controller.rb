class MessagingController < ApplicationController
  include ActionController::Live

  def send_message
    response.headers['Content-Type'] = 'text/event-stream'
    10.times {
      response.stream.write "This is a test Messagen"
      sleep 1
    }
    response.stream.close
  end
end