module Nineteen
  module Eighty
    module Two
      class Spectrum
        CHARACTERS = YAML.load_file File.join File.dirname(__FILE__), '..', '..', '..', '..', 'config', 'characters.yml'

        def self.[] *text
        #  require "pry" ; binding.pry
          a = []
          text.each do |t|
            a += Spectrum.linify(t.chars.map { |c| Spectrum.get(c) })
          end

          a
        end

        def self.get key
          key = ' ' unless CHARACTERS[key]
          CHARACTERS[key].map { |b| Spectrum.bits(b) }
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
