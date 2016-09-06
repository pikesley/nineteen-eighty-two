module Nineteen::Eighty::Two
  module Formatters
    describe SVG do
      it 'formats a row' do
        expect(described_class.row [0, 0, 0, 0, 0, 0, 0, 0]).to eq ""
        expect(described_class.row [0, 0, 1, 0, 0, 0, 0, 0]).to eq "<rect x='2' y='0' width='1' height='1' class='on' />"
      end

      it 'formats a string' do
        expect(described_class.body '/').to eq (
        """<rect x='6' y='2' width='1' height='1' class='on' />
<rect x='5' y='3' width='1' height='1' class='on' />
<rect x='4' y='4' width='1' height='1' class='on' />
<rect x='3' y='5' width='1' height='1' class='on' />
<rect x='2' y='6' width='1' height='1' class='on' />"""
        )
      end

      it 'returns an SVG' do
        expect(described_class.format '/').to eq (
"""<svg viewBox='0 0 8 8' xmlns='http://www.w3.org/2000/svg'>
  <style type='text/css'>
    <![CDATA[
      rect.on {
        fill: #000000;
      }
    ]]>
  </style>
  <g>
<rect x='6' y='2' width='1' height='1' class='on' />
<rect x='5' y='3' width='1' height='1' class='on' />
<rect x='4' y='4' width='1' height='1' class='on' />
<rect x='3' y='5' width='1' height='1' class='on' />
<rect x='2' y='6' width='1' height='1' class='on' />
  </g>
</svg>
""")
      end
    end
  end
end
