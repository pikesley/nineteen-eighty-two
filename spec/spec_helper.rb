require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'nineteen/eighty/two'

RSpec.configure do |config|
  config.order = :random
end
