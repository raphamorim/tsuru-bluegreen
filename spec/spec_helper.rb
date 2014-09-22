ENV['RACK_ENV'] = 'test'

$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require 'rspec'
require 'webmock/rspec'
require 'tsuru-bluegreen'


RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
  config.color = true
  config.formatter = :documentation
end
