#!/usr/bin/env ruby
# example: flash.rb -l 3 -t 5 -c red -n 3
require 'ostruct'
require 'optparse'
require_relative '../lib/philips_hue'

# set default values here

options = OpenStruct.new
options.light_id = 2
options.delay    = 1
options.repeat   = 3
options.crazy    = false
options.color    = PhilipsHue::Helpers::RED

# get everything ready...
hue = PhilipsHue::Bridge.new(PhilipsHue::Config::API_URL,PhilipsHue::Config::APP_NAME)
light = hue.light(options.light_id)

# ...make magic happen
light.clear
options.repeat.times do |n|
  puts "flashing light ##{options.light_id}"
  light.flash(options.color, options.delay, options.crazy)
  sleep options.delay unless options.repeat == n+1
end
