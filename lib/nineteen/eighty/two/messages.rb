module Nineteen
  module Eighty
    module Two
      class Messages
        MESSAGES = YAML.load_file File.join File.dirname(__FILE__), '..', '..', '..', '..', 'config', 'messages.yml'

        def self.[] key
          key = key.to_s.upcase
          raise Exceptions::SpectrumException.new "Q - #{MESSAGES['Q']}" unless MESSAGES.has_key? key
          "#{key} - #{MESSAGES[key]}"
        end

        def self.to_h
          MESSAGES
        end

        def self.method_missing m, *args
          key = case m
          when :zero
            0
          when :one
            1
          when :two
            2
          when :three
            3
          when :four
            4
          when :five
            5
          when :six
            6
          when :seven
            7
          when :eight
            8
          when :nine
            9
          else
            m.to_s
          end
          self[key]
        end
      end
    end
  end
end
