module Nineteen::Eighty::Two
  describe Colours do
    it 'knows what red is' do
      expect(described_class['red']).to eq 'bf0000'
    end

    it 'knows what blue is' do
      expect(described_class['blue']).to eq '0000bf'
    end

    it 'knows how to make magenta' do
      expect(described_class['magenta']).to eq 'bf00bf'
    end

    it 'gets black' do
      expect(described_class['black']).to eq '000000'
    end

    it 'gets white' do
      expect(described_class['white']).to eq 'bfbfbf'
    end

    context 'BRIGHT colours' do
      specify 'primary colours' do
        expect(described_class['GREEN']).to eq '00ff00'
      end

      specify 'secondary colours' do
        expect(described_class['CYAN']).to eq '00ffff'
      end

      specify 'does not attempt to brighten black' do
        expect(described_class['BLACK']).to eq '000000'
      end
    end

    context 'method-type access' do
      it 'allows method-type access' do
        expect(described_class.blue).to eq '0000bf'
      end

      specify 'even for CAPS' do
        expect(described_class.MAGENTA).to eq 'ff00ff'
      end
    end
  end
end
