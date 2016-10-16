require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'coveralls/rake/task'

Coveralls::RakeTask.new
RSpec::Core::RakeTask.new

task :default => [:spec, 'coveralls:push']

namespace :generate do
  task :svg, [:text] do |t, args|
    require_relative 'lib/nineteen/eighty/two'
    if args[:text]
      puts Nineteen::Eighty::Two::Formats::SVG.format args[:text]
    else
      puts 'Usage: rake generate:svg[text]'
      exit 1
    end
  end
end
