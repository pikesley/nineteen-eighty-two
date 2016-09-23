[![Build Status](http://img.shields.io/travis/pikesley/nineteen-eighty-two.svg?style=flat-square)](https://travis-ci.org/pikesley/nineteen-eighty-two)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/nineteen-eighty-two.svg?style=flat-square)](https://gemnasium.com/pikesley/nineteen-eighty-two)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/nineteen-eighty-two.svg?style=flat-square)](https://coveralls.io/r/pikesley/nineteen-eighty-two)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/nineteen-eighty-two.svg?style=flat-square)](https://codeclimate.com/github/pikesley/nineteen-eighty-two)
[![Gem Version](http://img.shields.io/gem/v/nineteen-eighty-two.svg?style=flat-square)](https://rubygems.org/gems/nineteen-eighty-two)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://pikesley.mit-license.org)

# 1982

## Sinclair Spectrum Stuff as a Rubygem

A massively over-engineered solution to a set of problems that I'm almost 100% certain do not exist

* rendering text in the 1982 Sinclair Spectrum character set, in a variety of formats
* serving all of the Spectrum's 15 colours as HTML hex colours
* serving the complete set of Spectrum error messages

    git clone https://github.com/pikesley/nineteen-eighty-two
    cd nineteen-eighty-two
    bundle
    rake

Or just

    gem install nineteen-eighty-two

## API

### Font

From the [specs](https://github.com/pikesley/nineteen-eighty-two/tree/master/spec/nineteen/eighty/two):

#### Just the data

##### Transform a string into an array-of-arrays of bits

    require 'nineteen/eighty/two'

    module Nineteen::Eighty::Two
      describe Spectrum do
        it 'returns an array of arrays' do
          expect(described_class['ab']).to eq [
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
            [0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0],
            [0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0],
            [0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0],
            [0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
          ]
        end
      end
    end

#### Specific output formats

##### HTML table

    require 'nineteen/eighty/two'

    module Nineteen::Eighty::Two
      module Formats
        describe HTMLTable do
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
        end
      end
    end

##### JSON

    require 'nineteen/eighty/two'

    module Nineteen::Eighty::Two
      module Formats
        describe JSON do
          expect(described_class.format 'ab').to eq ({
            :id   => 'ab',
            :data => [
              [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
              [0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0],
              [0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0],
              [0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0],
              [0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0],
              [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            ]
          }.to_json)
        end
      end
    end

##### SVG

    require 'nineteen/eighty/two'

    module Nineteen::Eighty::Two
      module Formats
        describe SVG do
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

          it 'sets the colour' do
                expect(described_class.format '/', {colour: '#fa8100'}).to match /fill: #fa8100;/
          end
        end
      end
    end

##### Text

    require 'nineteen/eighty/two'

    module Nineteen::Eighty::Two
      module Formats
        describe Text do
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

### Colours

    require 'nineteen/eighty/two'

    module Nineteen::Eighty::Two
      describe Colours do
        it 'knows what red is' do
          expect(described_class['red']).to eq 'bf0000'
        end

        it 'knows how to make magenta' do
          expect(described_class['magenta']).to eq 'bf00bf'
        end

        context 'BRIGHT colours' do
          specify 'primary colours' do
            expect(described_class['GREEN']).to eq '00ff00'
          end
        end

        context 'method-type access' do
          it 'allows method-type access' do
            expect(described_class.blue).to eq '0000bf'
          end
        end
      end
    end

### Error messages

    require 'nineteen/eighty/two'

    module Nineteen::Eighty::Two
      describe Messages do
        it 'has error messages' do
          expect(described_class['R']).to eq 'R - Tape loading error'
        end

        it 'supports case-insensitive lookups' do
          expect(described_class['c']).to eq 'C - Nonsense in BASIC'
        end

        it 'is polite about non-existent keys' do
          expect { described_class['Z'] }.to raise_exception do |e|
            expect(e).to be_an Exceptions::SpectrumException
            expect(e.message).to eq 'Q - Parameter error'
          end
        end
      end
    end

## FAQ

Your questions, answered

### Why the stupid module structure?

I realise that `Nineteen::Eighty::Two::Formats::HTMLTable.format` is a ludicrously long method name, but it turns out if you do `bundle gem nineteen-eighty-two`, this module hierarchy is what you're presented with, and I actually kind of like it (I did try to call it `1982` but apparently that's not a kosher Gem name)

### Why doesn't it output in _${other_format}_

If you can think of another format I could support, let me know and I'll have a go. I am also [open to PRs](https://github.com/pikesley/nineteen-eighty-two/pulls), of course

### Where can I play with this?

I've wrapped this Gem in a RESTful API [over here](http://uncleclive.herokuapp.com/)

### Why have you done this?

Have you met me? Also, because I'm [moderately obsessed with this font](https://www.youtube.com/watch?v=Qt_J0jNqtZg)
