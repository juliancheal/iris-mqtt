require "celluloid"
require "client"

module Iris
  module MQTT
    class Superviser < Celluloid::SupervisionGroup
      supervise Iris::MQTT::Shocket, as: :socket
    end
  end
end
