#!/usr/bin/env ruby

require 'awesome_print'
require './phillips_hue'


# put your customizations here
hue = PhillipsHue.new("lightsapp", "192.168.1.14")

# register the script with the Hue
#app.register!

# assign in order by their light_id
front_right = hue.add_light(:front_right)
back_right  = hue.add_light(:back_right)
front_left  = hue.add_light(:front_left)

#ap hue.overview
#ap hue.status front_right
#ap front_right.state
#puts front_right.colormode
puts front_right

# change this to loop pretty colors
looping = true
loop do

  front_left.red
  front_right.green
  back_right.blue

  sleep 1

  front_left.blue
  front_right.blue
  back_right.yellow

  sleep 1

  front_left.yellow
  front_right.red
  back_right.red

  sleep 1

end if looping




__END__
# api_url can be found at:
# https://www.meethue.com/en-US/user/preferencessmartbridge

# extra details about hacking Hues:
# http://rsmck.co.uk/hue

# register worked response:
# => [{"success"=>{"username"=>"5a90e47a2ac90131ace46cce377bdc64"}}]

# register failed response (press link button):
# => [{"error"=>
#     {"address"=>"", "type"=>101, "description"=>"link button not pressed"}}]