#!/usr/bin/env ruby
require_relative '../lib/philips_hue'

hue = PhilipsHue::Bridge.new(PhilipsHue::Config::API_URL,PhilipsHue::Config::APP_NAME)
light2, light1, light3 = hue.lights

# loop pretty colors

light1.red
light2.red
light3.red

light1.on!
light2.on!
light3.on!

loop do

  sleep 0.01

  light1.yellow
  light1.blip

  sleep 0.01

  light1.red
  light2.yellow
  light2.blip

  sleep 0.01
  
  light2.red
  light3.yellow
  light3.blip
  
  sleep 0.01
  
  light3.red

end
