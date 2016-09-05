module Nineteen
  module Eighty
    module Two
      module Formatters
        class TextFormatter
          def self.format text, options = {}
            on = options.fetch(:on, '1')
            off = options.fetch(:off, '0')

            s = Spectrum.new
            s[text].map { |t| t.join }.join("\n").gsub('0', off).gsub('1', on)
          end
        end
      end
    end
  end
end
