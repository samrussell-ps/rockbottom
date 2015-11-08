require 'spec_helper'
require './lib/cave'
require 'stringio'

describe Cave do
  let(:sample_string) { "5\n" +
                        "\n" +
                        "#####\n" +
                        "~   #\n" +
                        "#   #\n" +
                        "#####"
  }

  describe '.from_file' do
    let(:fake_file) { StringIO.new(sample_string) }
    let(:path) { 'test path' }
    subject(:cave_from_file) { Cave.from_file(path) }

    it 'loads a cave from the file' do
      expect(File).to receive(:open).with(path).and_return(fake_file)
      expect(cave_from_file.water).to eq(5)
      expect(cave_from_file.cell(2, 0)).to eq('#')
      expect(cave_from_file.cell(2, 1)).to eq(' ')
      expect(cave_from_file.cell(0, 1)).to eq('~')
    end
  end

  describe '.from_string' do
    subject(:cave_from_string) { Cave.from_string(sample_string) }

    it 'loads a cave from the string' do
      expect(cave_from_string.water).to eq(5)
      expect(cave_from_string.cell(2, 0)).to eq('#')
      expect(cave_from_string.cell(2, 1)).to eq(' ')
      expect(cave_from_string.cell(0, 1)).to eq('~')
    end
  end

  describe '#set_cell' do
    let(:cave_from_string) { Cave.from_string(sample_string) }

    it 'changes the value of a cell' do
      expect(cave_from_string.cell(1, 1)).to eq(' ')
      cave_from_string.set_cell(1, 1, '~')
      expect(cave_from_string.cell(1, 1)).to eq('~')
    end
  end

  describe '#to_image' do
    let(:expected_image) {
                        "#####\n" +
                        "~   #\n" +
                        "#   #\n" +
                        "#####"
    }

    let(:cave_from_string) { Cave.from_string(sample_string) }
    subject { cave_from_string.to_image }

    it { is_expected.to eq(expected_image) }
  end
end
