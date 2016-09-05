module Nineteen
  module Eighty
    module Two
      module Formatters
        class JSONFormatter
          def self.format text
            {
              id: text,
              data: Spectrum[text]
            }.to_json
          end
        end
      end
    end
  end
end
