module Nineteen::Eighty::Two
  describe RunLengthEncoder do
    it 'encodes a row correctly' do
      expect(described_class.encode [1, 1, 1, 0, 0, 0, 1]).to eq [
        { 1 => 3 },
        { 0 => 3 },
        { 1 => 1 }
      ]
    end
  end
end
