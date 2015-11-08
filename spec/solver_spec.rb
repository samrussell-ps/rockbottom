require 'spec_helper'
require './lib/solver'

describe Solver do
  let(:water) { 0 }
  let(:sample_string) { water.to_s + "\n" +
                        "\n" +
                        "#########\n" +
                        "~       #\n" +
                        "#       #\n" +
                        "#       #\n" +
                        "#   #   #\n" +
                        "#   #   #\n" +
                        "#   #   #\n" +
                        "#########"
  }
  let(:initial_cave) { Cave.from_string(sample_string) }
  let(:solver) { Solver.new(initial_cave) }
  subject(:cave_solution_image) { solver.cave.to_image }

  context 'with 0 water' do
    let(:expected_image) { 
                        "#########\n" +
                        "~       #\n" +
                        "#       #\n" +
                        "#       #\n" +
                        "#   #   #\n" +
                        "#   #   #\n" +
                        "#   #   #\n" +
                        "#########"
    }

    it { is_expected.to eq(expected_image) }
  end

  context 'with 1 water' do
    let(:water) { 1 }
    let(:expected_image) { 
                        "#########\n" +
                        "~~      #\n" +
                        "#       #\n" +
                        "#       #\n" +
                        "#   #   #\n" +
                        "#   #   #\n" +
                        "#   #   #\n" +
                        "#########"
    }

    it { is_expected.to eq(expected_image) }
  end
end
