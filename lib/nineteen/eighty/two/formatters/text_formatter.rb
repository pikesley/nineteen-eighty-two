module Nineteen
  module Eighty
    module Two
      module Formatters
        class TextFormatter
          def self.format text
            s = Spectrum.new
            s[text].map { |t| t.join }.join "\n"
          end
        end
      end
    end
  end
end
