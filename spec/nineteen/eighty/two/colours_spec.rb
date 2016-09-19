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

    it 'returns all the colours' do
      expect(described_class.to_h).to eq (
        {
          BLACK: "000000",
          black: "000000",
          BLUE: "0000ff",
          blue: "0000bf",
          CYAN: "00ffff",
          cyan: "00bfbf",
          GREEN: "00ff00",
          green: "00bf00",
          MAGENTA: "ff00ff",
          magenta: "bf00bf",
          RED: "ff0000",
          red: "bf0000",
          WHITE: "ffffff",
          white: "bfbfbf",
          YELLOW: "ffff00",
          yellow: "bfbf00"
        }
      )
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
