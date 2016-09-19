module Nineteen
  module Eighty
    module Two
      class Colours

        PRIMARIES = YAML.load_file File.join File.dirname(__FILE__), '..', '..', '..', '..', 'config', 'colours.yml'
        PRIMARIES.keys.map do |p|
          self.const_set p.upcase, PRIMARIES[p]
        end

        BLACK = 0
        YELLOW = RED + GREEN
        CYAN = GREEN + BLUE
        MAGENTA = RED + BLUE
        WHITE = RED + GREEN + BLUE

        def self.[] key
          hex = "%06x" % (self.const_get key.upcase)
          return brighten hex if key.upcase == key
          hex
        end

        def self.method_missing m, *args
          self[m]
        end

        def self.brighten colour
          colour.gsub 'b', 'f'
        end
      end
    end
  end
end
