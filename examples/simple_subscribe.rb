require "iris_mqtt"

client = Iris::MQTT::Client.connect('127.0.0.1:1883')

client.subscribes("greeting")
client.read

client.subscription("greeting") do |message|
  puts "Message: #{message}"
end
Iris::MQTT::Superviser.run
