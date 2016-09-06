require 'yaml'
require 'matrix'
require 'erubis'

require 'nineteen/eighty/two/version'
require 'nineteen/eighty/two/spectrum'

require 'nineteen/eighty/two/decorators/run_length_encoder'

require 'nineteen/eighty/two/formatters/text_formatter'
require 'nineteen/eighty/two/formatters/json_formatter'
require 'nineteen/eighty/two/formatters/html_table_formatter'
require 'nineteen/eighty/two/formatters/svg_formatter'

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
