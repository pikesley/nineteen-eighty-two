module Nineteen
  module Eighty
    module Two
      module Formatters
        class HTMLTable
          def self.format text
            lines = Spectrum[text]

            t = File.read File.open File.join templates_dir, 'table.eruby'
            context = {
              title: text,
              blanks: blanks(lines),
              rows: lines.map { |l| row(l) }.join("\n")
            }
            Erubis::Eruby.new(t).evaluate(context).strip
          end

          def self.blanks lines
            t = File.read File.open File.join templates_dir, 'row.eruby'
            context = {
              cells: lines.map { |b| cell Span.new(0, 1) }.join
            }
            Erubis::Eruby.new(t).evaluate(context).strip
          end

          def self.cell span
            t = File.read File.open File.join templates_dir, 'cell.eruby'
            context = {
              style: span.type == 1 ? 'on' : 'off',
            }
            context[:colspan] = span.width if span.width > 1
            Erubis::Eruby.new(t).evaluate(context).strip
          end

          def self.row list
            t = File.read File.open File.join templates_dir, 'row.eruby'
            context = {
              cells: Decorators::RunLengthEncoder.encode(list).map { |i| cell i }.join
            }
            Erubis::Eruby.new(t).evaluate(context).strip
          end

          def self.templates_dir
            File.join File.dirname(__FILE__),'..', 'templates', 'html', 'table'
          end
        end
      end
    end
  end
end
