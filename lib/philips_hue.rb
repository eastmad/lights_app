require 'digest/md5'
require 'httparty'
require 'json'

begin
  require_relative '../config'
rescue LoadError
  puts "Copy config.rb.template to config.rb and fill it in"
  puts "Enter your appname and bridge url"
  exit
end
require_relative 'philips_hue/version'
require_relative 'philips_hue/helpers'

require_relative 'philips_hue/bridge'
require_relative 'philips_hue/light'

module PhilipsHue
  # make this module a singleton
  extend self
end
