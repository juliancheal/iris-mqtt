require "celluloid"
require "client"

module Iris
  module MQTT
    class Superviser < Celluloid::SupervisionGroup
      supervise Iris::MQTT::Client, as: :client
    end
  end
end
