# config/initializers/pusher.rb
require 'pusher'

Pusher.app_id = '207805'
Pusher.key = 'a26a43a4d594161cec60'
Pusher.secret = '9966178d722b484ca28f'
Pusher.logger = Rails.logger
Pusher.encrypted = true

# app/controllers/hello_world_controller.rb
class HelloWorldController < ApplicationController
  def hello_world
    Pusher.trigger('test_channel', 'my_event', {
      message: 'hello world'
    })
  end
end