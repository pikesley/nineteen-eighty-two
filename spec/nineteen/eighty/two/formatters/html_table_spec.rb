module Nineteen::Eighty::Two
  module Formatters
    describe HTMLTableFormatter do
      it 'returns a table' do
        expect(described_class.format ' ').to match /<table/
      end

      it 'returns a complete table' do
        expect(described_class.format 'a').to match /<!-- a --><table class="sinclair"><tr class="sinclair"><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><td class="off"> <\/td><\/tr><tr class="sinclair"><td class="off" colspan="8"> <\/td><\/tr><tr class="sinclair"><td class="off" colspan="8"> <\/td><\/tr><tr class="sinclair"><td class="off" colspan="2"> <\/td><td class="on" colspan="3"> <\/td><td class="off" colspan="3"> <\/td><\/tr><tr class="sinclair"><td class="off" colspan="5"> <\/td><td class="on"> <\/td><td class="off" colspan="2"> <\/td><\/tr><tr class="sinclair"><td class="off" colspan="2"> <\/td><td class="on" colspan="4"> <\/td><td class="off" colspan="2"> <\/td><\/tr><tr class="sinclair"><td class="off"> <\/td><td class="on"> <\/td><td class="off" colspan="3"> <\/td><td class="on"> <\/td><td class="off" colspan="2"> <\/td><\/tr><tr class="sinclair"><td class="off" colspan="2"> <\/td><td class="on" colspan="4"> <\/td><td class="off" colspan="2"> <\/td><\/tr><tr class="sinclair"><td class="off" colspan="8"> <\/td><\/tr><\/table>/
      end
    end
  end
end
