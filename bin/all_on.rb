#!/usr/bin/env ruby
require_relative '../lib/philips_hue'

hue = PhilipsHue::Bridge.new(PhilipsHue::Config::API_URL,PhilipsHue::Config::APP_NAME)
lights = hue.lights
lights.each {|light| light.on!}
