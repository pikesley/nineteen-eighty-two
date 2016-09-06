module Nineteen
  module Eighty
    module Two
      module Formats
        class SVG
          def self.format text, options = {}
            t = File.read File.open File.join templates_dir, 'document.eruby'
            context = {
              width: text.length * 8,
              height: 8,
              fill_colour: options.fetch(:on_colour, '#000000'),
              body: body(text)
            }
            Erubis::Eruby.new(t).evaluate(context)
          end

          def self.body text
            rows = []
            Spectrum[text].each_with_index do |line, index|
              rows.push row(line, index)
            end
            rows.join("\n").strip
          end

          def self.row list, index = 0
            x = 0
            cells = []
            Decorators::RunLengthEncoder.encode(list).each do |item|
              if item.type == 1
                t = File.read File.open File.join templates_dir, 'cell.eruby'
                context = {
                  x: x,
                  y: index,
                  width: item.width,
                  height: 1,
                  style: 'on'
                }
                cells.push Erubis::Eruby.new(t).evaluate(context)
              end
              x += item.width
            end

            cells.join("\n").strip
          end

          def self.templates_dir
            File.join File.dirname(__FILE__),'..', 'templates', 'svg'
          end
        end
      end
    end
  end
end
