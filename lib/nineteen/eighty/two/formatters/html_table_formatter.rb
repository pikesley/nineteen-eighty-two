module Nineteen
  module Eighty
    module Two
      module Formats
        class HTMLTable
          def self.format text
            lines = Spectrum[*text]

            t = File.read File.open File.join Nineteen::Eighty::Two.templates_dir, 'html', 'table', 'table.eruby'
            context = {
              title: text.to_s.gsub('"', ''),
              blanks: blanks(lines.first),
              rows: lines.map { |l| row(l) }.join("\n")
            }
            Erubis::Eruby.new(t).evaluate(context).strip
          end

          def self.blanks lines
            t = File.read File.open File.join Nineteen::Eighty::Two.templates_dir, 'html', 'table', 'row.eruby'
            context = {
              cells: lines.map { |b| cell Span.new(0, 1) }.join
            }
            Erubis::Eruby.new(t).evaluate(context).strip
          end

          def self.cell span
            t = File.read File.open File.join Nineteen::Eighty::Two.templates_dir, 'html', 'table', 'cell.eruby'
            context = {
              style: span.type == 1 ? 'on' : 'off',
            }
            context[:colspan] = span.width if span.width > 1
            Erubis::Eruby.new(t).evaluate(context).strip
          end

          def self.row list
            t = File.read File.open File.join Nineteen::Eighty::Two.templates_dir, 'html', 'table', 'row.eruby'
            context = {
              cells: Decorators::RunLengthEncoder.encode(list).map { |i| cell i }.join
            }
            Erubis::Eruby.new(t).evaluate(context).strip
          end
        end
      end
    end
  end
end
