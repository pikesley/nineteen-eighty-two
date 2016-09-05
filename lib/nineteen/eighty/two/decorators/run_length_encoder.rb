module Nineteen
  module Eighty
    module Two
      module Decorators
        class RunLengthEncoder
          def self.encode row
            result = []
            count = 0
            step = 0
            while step < row.length
              current = row[step]
              step += 1
              nxt = row[step]
              if nxt == current
                count += 1
              else
                result << {
                  current => count + 1
                }
                count = 0
                current = nxt
              end
            end

            result
          end
        end
      end
    end
  end
end
