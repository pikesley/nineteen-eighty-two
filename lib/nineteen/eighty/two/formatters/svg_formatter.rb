module Nineteen
  module Eighty
    module Two
      module Formats
        class SVG
          def self.format text, options = {}
            text = [text] unless text.is_a? Array

            t = File.read File.open File.join Nineteen::Eighty::Two.templates_dir, 'svg', 'document.eruby'
            context = {
              width: text.longest * 8,
              height: text.count * 8,
              fill_colour: options.fetch(:colour, nil),
              class: options.fetch(:class, nil),
              body: body(text)
            }
            Erubis::Eruby.new(t).evaluate(context)
          end

          def self.body text
            rows = []
            text.each_with_index do |line, count|
              Spectrum[line].each_with_index do |line, index|
                rows.push row(line, index + (count * 8))
              end
            end
            rows.flatten
          end

          def self.row list, index = 0
            x = 0
            cells = []
            Decorators::RunLengthEncoder.encode(list).each do |item|
              if item.type == 1
                t = File.read File.open File.join Nineteen::Eighty::Two.templates_dir, 'svg', 'cell.eruby'
                context = {
                  x: x,
                  y: index,
                  width: item.width,
                  height: 1,
                  style: 'on'
                }
                cells.push Erubis::Eruby.new(t).evaluate(context).strip
              end
              x += item.width
            end

            cells
          end

          def self.longest list
            list.map { |i| i.length }.max
          end
        end
      end
    end
  end
end
