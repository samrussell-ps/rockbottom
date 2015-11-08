require 'spec_helper'
require './lib/solver'

describe Solver do
  let(:water) { 1 }
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

  describe '#solution' do
    subject(:cave_solution_image) { solver.solution.to_image }
    context 'with 1 water' do
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

    context 'with 2 water' do
      let(:water) { 2 }
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

    context 'with 3 water' do
      let(:water) { 3 }
      let(:expected_image) { 
                          "#########\n" +
                          "~~      #\n" +
                          "#~      #\n" +
                          "#       #\n" +
                          "#   #   #\n" +
                          "#   #   #\n" +
                          "#   #   #\n" +
                          "#########"
      }

      it { is_expected.to eq(expected_image) }
    end

    context 'with 7 water' do
      let(:water) { 7 }
      let(:expected_image) { 
                          "#########\n" +
                          "~~      #\n" +
                          "#~      #\n" +
                          "#~      #\n" +
                          "#~  #   #\n" +
                          "#~  #   #\n" +
                          "#~  #   #\n" +
                          "#########"
      }

      it { is_expected.to eq(expected_image) }
    end

    context 'with 8 water' do
      let(:water) { 8 }
      let(:expected_image) { 
                          "#########\n" +
                          "~~      #\n" +
                          "#~      #\n" +
                          "#~      #\n" +
                          "#~  #   #\n" +
                          "#~  #   #\n" +
                          "#~~ #   #\n" +
                          "#########"
      }

      it { is_expected.to eq(expected_image) }
    end

    context 'with 9 water' do
      let(:water) { 9 }
      let(:expected_image) { 
                          "#########\n" +
                          "~~      #\n" +
                          "#~      #\n" +
                          "#~      #\n" +
                          "#~  #   #\n" +
                          "#~  #   #\n" +
                          "#~~~#   #\n" +
                          "#########"
      }

      it { is_expected.to eq(expected_image) }
    end

    context 'with 10 water' do
      let(:water) { 10 }
      let(:expected_image) { 
                          "#########\n" +
                          "~~      #\n" +
                          "#~      #\n" +
                          "#~      #\n" +
                          "#~  #   #\n" +
                          "#~~ #   #\n" +
                          "#~~~#   #\n" +
                          "#########"
      }

      it { is_expected.to eq(expected_image) }
    end

    context 'with 11 water' do
      let(:water) { 11 }
      let(:expected_image) { 
                          "#########\n" +
                          "~~      #\n" +
                          "#~      #\n" +
                          "#~      #\n" +
                          "#~  #   #\n" +
                          "#~~~#   #\n" +
                          "#~~~#   #\n" +
                          "#########"
      }

      it { is_expected.to eq(expected_image) }
    end

    context 'with 16 water' do
      let(:water) { 16 }
      let(:expected_image) { 
                          "#########\n" +
                          "~~      #\n" +
                          "#~      #\n" +
                          "#~~~~   #\n" +
                          "#~~~#   #\n" +
                          "#~~~#   #\n" +
                          "#~~~#   #\n" +
                          "#########"
      }

      it { is_expected.to eq(expected_image) }
    end

    context 'with 17 water' do
      let(:water) { 17 }
      let(:expected_image) { 
                          "#########\n" +
                          "~~      #\n" +
                          "#~      #\n" +
                          "#~~~~~  #\n" +
                          "#~~~#   #\n" +
                          "#~~~#   #\n" +
                          "#~~~#   #\n" +
                          "#########"
      }

      it { is_expected.to eq(expected_image) }
    end

    context 'with 18 water' do
      let(:water) { 18 }
      let(:expected_image) { 
                          "#########\n" +
                          "~~      #\n" +
                          "#~      #\n" +
                          "#~~~~~  #\n" +
                          "#~~~#~  #\n" +
                          "#~~~#   #\n" +
                          "#~~~#   #\n" +
                          "#########"
      }

      it { is_expected.to eq(expected_image) }
    end

    context 'with 26 water' do
      let(:water) { 26 }
      let(:expected_image) { 
                          "#########\n" +
                          "~~      #\n" +
                          "#~      #\n" +
                          "#~~~~~  #\n" +
                          "#~~~#~~~#\n" +
                          "#~~~#~~~#\n" +
                          "#~~~#~~~#\n" +
                          "#########"
      }

      it { is_expected.to eq(expected_image) }
    end

    context 'with 28 water' do
      let(:water) { 28 }
      let(:expected_image) { 
                          "#########\n" +
                          "~~      #\n" +
                          "#~      #\n" +
                          "#~~~~~~~#\n" +
                          "#~~~#~~~#\n" +
                          "#~~~#~~~#\n" +
                          "#~~~#~~~#\n" +
                          "#########"
      }

      it { is_expected.to eq(expected_image) }
    end

    context 'with 29 water' do
      let(:water) { 29 }
      let(:expected_image) { 
                          "#########\n" +
                          "~~      #\n" +
                          "#~~     #\n" +
                          "#~~~~~~~#\n" +
                          "#~~~#~~~#\n" +
                          "#~~~#~~~#\n" +
                          "#~~~#~~~#\n" +
                          "#########"
      }

      it { is_expected.to eq(expected_image) }
    end
  end
end
