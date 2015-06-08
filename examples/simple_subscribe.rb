require "iris_mqtt"

client = Iris::MQTT::Client.connect('127.0.0.1:1883')

client.subscribe("greeting")
client.subscribe("time")
client.start

client.subscription("greeting") do |message|
  puts "Message: #{message}"
end

client.subscription("time") do |message|
  puts "The time is: #{message}"
end

Iris::MQTT::Superviser.run
