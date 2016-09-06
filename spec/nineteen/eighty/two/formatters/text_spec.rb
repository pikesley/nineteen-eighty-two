module Nineteen::Eighty::Two
  module Formatters
    describe Text do
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

      it 'gives the correct character' do
        expect(described_class.format '/').to eq (
"""
00000000
00000000
00000010
00000100
00001000
00010000
00100000
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

      it 'returns characters other than zeroes and ones' do
        expect(described_class.format 'Sam', {on: 'X', off: '.'}).to eq (
"""
........................
..XXXX..................
.X........XXX....XX.X...
..XXXX.......X...X.X.X..
......X...XXXX...X.X.X..
.X....X..X...X...X.X.X..
..XXXX....XXXX...X.X.X..
........................
"""
).strip
      end
    end
  end
end
