module Nineteen
  module Eighty
    module Two
      module Formatters
        class JSONFormatter
          def self.format text
            s = Spectrum.new
            {
              id: text,
              data: s[text]
            }.to_json
          end
        end
      end
    end
  end
end
