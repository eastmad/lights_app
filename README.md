## Lights App

This is a library for accessing and controlling your [Philips Hue](http://www.meethue.com/) lights using Ruby.

#### TL;DR:

Install with `gem install philips_hue`. [Check out the bin/ directory for examples](https://github.com/dmerrick/lights_app/tree/master/bin) of how to use this project and what kind of things you can do.


### Registering with the Bridge

You need two things to connect with your Hue, a name for your app and the IP address of the white Hue bridge.

* The IP address can be found on the Hue Community site. Login, [go here](https://www.meethue.com/en-US/user/preferencessmartbridge), click "Show me more," and find the IP under "Internal IP address." Example: `"192.168.1.14"`
* The app name can be anything you like. You must register your app with the Hue by running `PhilipsHue#register` and pressing the button on the bridge. You must do this again for every new app name you create. Example: `"my light app"`
* Skip this step by running the [bin/register.rb](https://github.com/dmerrick/lights_app/blob/master/bin/register.rb) script.

Create a config.rb by copying from config.rb.template, and add the app name and api.
Then you can refer to them if you need to create a new bridge.

For example:
```ruby
  PhilipsHue::Bridge.register(PhilipsHue::Config::API_URL,PhilipsHue::Config::APP_NAME)
```

### Getting the State of a Light

There are many available status options in the `Light` class.

```ruby
  hue = PhilipsHue::Bridge.register(PhilipsHue::Config::API_URL,PhilipsHue::Config::APP_NAME)
  light1, light2, light3 = hue.lights
  puts light1.state
  puts light1.colormode
  puts light2.brightness
  puts light3
  # => "Front right is on and reachable"
```


### Changing the Color of a Light

To change the state of a light, simply modify the value of one of the state parameters. For example:

```ruby
  light1.xy  = PhilipsHue::Config::RED
  light1.ct  = 200
  light1.hue = 25000
  # etc.
```

#### Helper Methods

Some [helper methods](https://github.com/dmerrick/lights_app/blob/master/lib/philips_hue/helpers.rb), including default color options, are provided. For example:

```ruby
  light1.blue
  light2.red
  light3.green
  light1.blip  # blink once
  light2.blink # blink repeatedly
  light3.flash(PhilipsHue::Config::RED) # flash red
```


### See Also
* [RubyGems homepage for this project](https://rubygems.org/gems/philips_hue)
* [Official Philips Hue site](https://www.meethue.com/en-US)
* [My original gist](https://gist.github.com/dmerrick/5000839)
* [rsmck's hacking guide](http://rsmck.co.uk/hue)
* [Hue hackers' community site](http://www.everyhue.com/)
* [Thorough API docs](http://blog.ef.net/2012/11/02/philips-hue-api.html)
