require 'yaml'
require 'matrix'
require 'erubis'

require 'nineteen/eighty/two/version'
require 'nineteen/eighty/two/spectrum'
require 'nineteen/eighty/two/messages'
require 'nineteen/eighty/two/colours'
require 'nineteen/eighty/two/exceptions'

require 'nineteen/eighty/two/decorators/run_length_encoder'

require 'nineteen/eighty/two/formatters/text_formatter'
require 'nineteen/eighty/two/formatters/json_formatter'
require 'nineteen/eighty/two/formatters/html_table_formatter'
require 'nineteen/eighty/two/formatters/svg_formatter'

module Nineteen
  module Eighty
    module Two
      class Span < Hash
        def initialize type, width
          self[type] = width
        end

        def type
          self.keys.first
        end

        def width
          self.values.first
        end
      end

      def self.templates_dir
        File.join File.dirname(__FILE__), 'two', 'templates'
      end
    end
  end
end

class Array
  def longest
    self.map { |i| i.length }.max
  end
end
