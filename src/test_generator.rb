require 'collector'
require 'gmock_serializer'

require 'erb'

if ARGV[0] then
  collector = Collector.new
  test_suite = collector.scan_file ARGV[0]
  serializer = GMockSerializer.new
  p serializer.run test_suite
end

