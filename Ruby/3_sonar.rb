#!/usr/bin/env ruby

require 'serialport'

def check_distance(port)
  ser = SerialPort.new("#{port}", 9600, 8, 1)

  loop do
    ser.write "S"
    distance = ser.readline().strip
    print "Distance is #{distance} cm \r"
    STDOUT.flush
    sleep(1)
  end
end

if __FILE__ == $0
  if ARGV.empty?
    puts "usage: ruby #{__FILE__} <serial>"
  else
    check_distance(ARGV[0])
  end
end

