module Nineteen::Eighty::Two
  module Formatters
    describe TextFormatter do
      let(:s) { Spectrum.new }

      it 'gives the correct character' do
        expect(described_class.format 'a').to eq (
"""
00000000
00000000
00111000
00000100
00111100
01000100
00111100
00000000
"""
).strip
      end

      it 'gives the correct string' do
        expect(described_class.format 'ab').to eq (
"""
0000000000000000
0000000000100000
0011100000100000
0000010000111100
0011110000100010
0100010000100010
0011110000111100
0000000000000000
"""
).strip
      end
    end
  end
end
