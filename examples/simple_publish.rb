require "iris_mqtt"

client = Iris::MQTT::Client.connect('127.0.0.1:1883')

loop do |variable|
  client.publish("greeting", "hello world!")
  client.publish("time", Time.now)
  sleep 3
end

# sleep
