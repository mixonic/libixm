#!/usr/bin/env ruby

# Use this example with the packet_echo.hex.  First require IXM
#
require File.join( File.dirname(__FILE__), '..', 'libixm' )

# Next build the ixm object.  You may need to set a path to 
# SFBProg.
#
ixm = LibIXM.new(
  # :sfbprog_path => '/home/mixonic/Projects/antipasto_arduino/build/linux/work/hardware/uploaders/bin/sfbprog',
  :sfbprog_sketch => File.join( File.dirname(__FILE__), '..', 'sketches', 'packet_echo.hex' )
)

# Build a reflex for our packet
#
responded = false 

ixm.attach_reflex( /yodel/ ) do |packet|
  puts "IXM yodeled: #{packet}"
  responded = true
end

# Send a packet.
#
ixm << "yodel yo momma ha"

# Wait for the reponse.
#
loop {
  break if responded
}
