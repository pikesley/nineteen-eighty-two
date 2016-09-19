module Nineteen::Eighty::Two
  describe Messages do
    it 'has error messages' do
      expect(described_class['R']).to eq 'R - Tape loading error'
    end

    it 'supports case-insensitive lookups' do
      expect(described_class['c']).to eq 'C - Nonsense in BASIC'
    end

    it 'understands numbers as keys' do
      expect(described_class[1]).to eq '1 - NEXT without FOR'
    end

    it 'is polite about non-existent keys' do
      expect { described_class['Z'] }.to raise_exception do |e|
        expect(e).to be_an Exceptions::SpectrumException
        expect(e.message).to eq 'Q - Parameter error'
      end
    end

    it 'supports method-type access' do
      expect(described_class.m).to eq 'M - RAMTOP no good'
    end

    it 'translates numbers' do
      expect(described_class.seven).to eq '7 - RETURN without GO SUB'
    end
  end
end
