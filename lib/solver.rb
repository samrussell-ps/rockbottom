require './lib/cave'

class Solver
  def initialize(cave)
    @cave = cave
  end

  def solution
    @solved_cave = @cave.dup
    find_initial_water_position

    while @solved_cave.water_in_cave < @solved_cave.water
      add_one_unit_of_water_to_cave
    end

    @solved_cave
  end

  private

  def find_initial_water_position
    @x = 0
    @y = 0
    while @solved_cave.cell(@x, @y) != '~'
      @y += 1
    end
  end

  def add_one_unit_of_water_to_cave
    find_next_cell

    add_one_unit_of_water_to_cell
  end

  def find_next_cell
    if cell_below_is_empty?
      @y += 1
    elsif @solved_cave.cell(@x+1, @y) == ' '
      @x += 1
    else
      @y -= 1

      while @solved_cave.cell(@x-1, @y) == ' '
        @x -= 1
      end
    end
  end

  def cell_below_is_empty?
    @solved_cave.cell(@x, @y+1) == ' '
  end

  def add_one_unit_of_water_to_cell
    @solved_cave.set_cell(@x, @y, '~')
  end
end
