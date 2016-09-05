module Nineteen
  module Eighty
    module Two
      module Formatters
        class HTMLTableFormatter
          def self.format text
            s = '<!-- %s -->' % text
            s << '<table class="sinclair">'

            lines = Spectrum[text]
            s << self.build_row(self.make_blanks(lines.first))

            lines.each { |line| s << self.build_row(Nineteen::Eighty::Two::Decorators::RunLengthEncoder.encode line) }

            s << '</table>'
            s
          end

          def self.make_blanks text
            a = []
            (text.length * 8).times do |bit|
              a << { 0 => 1 }
            end

            a
          end

          def self.convert_line line
            line.map! { |i|
              {
                :class   => i.keys[0] == 1 ? "on" : "off",
                :colspan => i.values[0]
              }
            }
          end

          def self.build_row line
            s = '<tr class="sinclair">'

            convert_line line

            line.each do |bit|
              s << '<td class="%s"' % bit[:class]
              if bit[:colspan] > 1
                s << ' colspan="%d"' % bit[:colspan]
              end
              s << '> </td>'
            end

            s << '</tr>'

            s
          end
        end
      end
    end
  end
end
