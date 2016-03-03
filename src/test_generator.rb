require 'collector'
require 'gmock_serializer'

require 'erb'

if ARGV[0] then
  collector  = Collector.new
  test_suite = collector.scan_file ARGV[0]
  serializer = GMockSerializer.new
  test_code  = serializer.run test_suite
  File.open('test.cpp', 'w') { |file| file.write(test_code) }
end

