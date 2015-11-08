require './lib/cave'

class Solver
  attr_reader :cave

  def initialize(cave)
    @cave = cave
  end
end
