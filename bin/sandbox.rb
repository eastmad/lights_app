#!/usr/bin/env ruby
require 'pp'
require 'pry'
require '../philips_hue'

hue = PhilipsHue::Bridge.new(hue = PhilipsHue::Bridge.new(PhilipsHue::Config::API_URL,PhilipsHue::Config::APP_NAME))
a, b, c = hue.lights

# open an interactive session
binding.pry
