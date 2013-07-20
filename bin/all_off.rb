#!/usr/bin/env ruby
require_relative '../lib/philips_hue'

hue = PhilipsHue::Bridge.new(PhilipsHue::Config::API_URL,PhilipsHue::Config::APP_NAME)
light1, light2, light3 = hue.lights

light1.off!
light2.off!
light3.off!
