#!/usr/bin/env ruby
# example: register.rb --bridge 192.168.1.14 --app lightsapp

# this is a great place for a new user to start
# if you see "Success!", you're ready to start hacking

# any time you use a new app name, you will have to reregister

require 'rubygems'
require 'optparse'
require_relative '../lib/philips_hue'

# set the defaults
options = { :app_name => PhilipsHue::Bridge::DEFAULT_APP_NAME }

# parse the command line options
OptionParser.new do |opts|
  opts.banner = "Usage: register.rb [options]"
  opts.on("-a [app_name]","--app [app_name]", "The name of the app to register") do |app|
    options[:app_name] = app
  end
  opts.on("-b [addr]","--bridge [addr]", "The address of the Hue bridge") do |api|
    options[:api_url] = api
  end
end.parse!

# register the app with the hue bridge
# get ready to press the link button!
hue = PhilipsHue::Bridge.register(options[:api_url], options[:app_name])

# it worked!
# print some friendly info
puts
puts "Success!"
puts hue
puts hue.lights.first
