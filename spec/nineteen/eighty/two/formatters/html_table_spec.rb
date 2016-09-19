module Nineteen::Eighty::Two
  module Formats
    describe HTMLTable do
      it 'makes a cell' do
        expect(described_class.cell(Span.new 0, 1)).to eq "<td class='off'> </td>"
        expect(described_class.cell(Span.new 1, 19)).to eq "<td class='on' colspan='19'> </td>"
      end

      it 'makes a row' do
        expect(described_class.row [0, 1]).to eq "<tr><td class='off'> </td><td class='on'> </td></tr>"
        expect(described_class.row [1, 0, 0, 0, 1]).to eq "<tr><td class='on'> </td><td class='off' colspan='3'> </td><td class='on'> </td></tr>"
      end

      it 'makes a row of blanks' do
        expect(described_class.blanks [0, 0, 0]).to eq "<tr><td class='off'> </td><td class='off'> </td><td class='off'> </td></tr>"
      end

      it 'makes a table' do
        expect(described_class.format 'a').to eq (
          """<!-- a -->
<table class='sinclair'>
<tr><td class='off'> </td><td class='off'> </td><td class='off'> </td><td class='off'> </td><td class='off'> </td><td class='off'> </td><td class='off'> </td><td class='off'> </td></tr>
<tr><td class='off' colspan='8'> </td></tr>
<tr><td class='off' colspan='8'> </td></tr>
<tr><td class='off' colspan='2'> </td><td class='on' colspan='3'> </td><td class='off' colspan='3'> </td></tr>
<tr><td class='off' colspan='5'> </td><td class='on'> </td><td class='off' colspan='2'> </td></tr>
<tr><td class='off' colspan='2'> </td><td class='on' colspan='4'> </td><td class='off' colspan='2'> </td></tr>
<tr><td class='off'> </td><td class='on'> </td><td class='off' colspan='3'> </td><td class='on'> </td><td class='off' colspan='2'> </td></tr>
<tr><td class='off' colspan='2'> </td><td class='on' colspan='4'> </td><td class='off' colspan='2'> </td></tr>
<tr><td class='off' colspan='8'> </td></tr>
</table>"""
        )

        expect(described_class.format 'ab').to match /<td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td><td class='off'> <\/td>/
      end

      it 'makes a multi-line table' do
        expect(described_class.format ['a', 'b']).to eq (
        """<!-- [a, b] -->
<table class='sinclair'>
<tr><td class='off'> </td><td class='off'> </td><td class='off'> </td><td class='off'> </td><td class='off'> </td><td class='off'> </td><td class='off'> </td><td class='off'> </td></tr>
<tr><td class='off' colspan='8'> </td></tr>
<tr><td class='off' colspan='8'> </td></tr>
<tr><td class='off' colspan='2'> </td><td class='on' colspan='3'> </td><td class='off' colspan='3'> </td></tr>
<tr><td class='off' colspan='5'> </td><td class='on'> </td><td class='off' colspan='2'> </td></tr>
<tr><td class='off' colspan='2'> </td><td class='on' colspan='4'> </td><td class='off' colspan='2'> </td></tr>
<tr><td class='off'> </td><td class='on'> </td><td class='off' colspan='3'> </td><td class='on'> </td><td class='off' colspan='2'> </td></tr>
<tr><td class='off' colspan='2'> </td><td class='on' colspan='4'> </td><td class='off' colspan='2'> </td></tr>
<tr><td class='off' colspan='8'> </td></tr>
<tr><td class='off' colspan='8'> </td></tr>
<tr><td class='off' colspan='2'> </td><td class='on'> </td><td class='off' colspan='5'> </td></tr>
<tr><td class='off' colspan='2'> </td><td class='on'> </td><td class='off' colspan='5'> </td></tr>
<tr><td class='off' colspan='2'> </td><td class='on' colspan='4'> </td><td class='off' colspan='2'> </td></tr>
<tr><td class='off' colspan='2'> </td><td class='on'> </td><td class='off' colspan='3'> </td><td class='on'> </td><td class='off'> </td></tr>
<tr><td class='off' colspan='2'> </td><td class='on'> </td><td class='off' colspan='3'> </td><td class='on'> </td><td class='off'> </td></tr>
<tr><td class='off' colspan='2'> </td><td class='on' colspan='4'> </td><td class='off' colspan='2'> </td></tr>
<tr><td class='off' colspan='8'> </td></tr>
</table>"""
        )
      end
    end
  end
end
