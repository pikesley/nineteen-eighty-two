module Nineteen
  module Eighty
    module Two
      module Exceptions
        class SpectrumException < Exception
          attr_reader :message
          
          def initialize message
            @message = message
          end
        end
      end
    end
  end
end
