# IrisMQTT

TODO: Write a gem description
http://www.hivemq.com/mqtt-essentials-part-4-mqtt-publish-subscribe-unsubscribe/

This gem is based on the work by Ruby-MQTT https://github.com/njh/ruby-mqtt

## Installation

Add this line to your application's Gemfile:

    gem 'iris_mqtt'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iris_mqtt

## Usage

### Publish

```ruby
require "iris_mqtt"

client = Iris::MQTT::Client.connect('127.0.0.1:1883')

client.publish("greeting", "hello world!")
```

## Contributing

1. Fork it ( https://github.com/juliancheal/iris-mqtt/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
