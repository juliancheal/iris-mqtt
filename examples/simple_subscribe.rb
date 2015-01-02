require "iris_mqtt"

client = Iris::MQTT::Client.connect('127.0.0.1:1883')

client.subscribe("time")

topic,message = client.get
sleep
puts "#{topic}: #{message}"