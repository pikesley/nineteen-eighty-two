module Nineteen
  module Eighty
    module Two
      class Spectrum
        def chars
          @chars ||= YAML.load_file File.join File.dirname(__FILE__), '..', '..', '..', '..', 'config', 'characters.yml'
        end

        def [] key
          Spectrum.linify key.chars.map { |c| get(c) }
        end

        def get key
          key = ' ' unless chars[key]
          chars[key].map { |b| Spectrum.bits(b) }
        end

        def self.bits number
          (0..7).map do |i|
            number[i]
          end.reverse
        end

        def self.linify *list
          Matrix.columns(list.first).to_a.map { |l| l.flatten }
        end
      end
    end
  end
end
