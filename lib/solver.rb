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
    if cell_is_empty?(:down)
      move_one_cell(:down)
    elsif cell_is_empty?(:right)
      move_one_cell(:right)
    else
      move_one_cell(:up)

      while cell_is_empty?(:left)
        move_one_cell(:left)
      end
    end
  end

  def cell_is_empty?(direction)
    @solved_cave.cell(@x + x_offset(direction), @y + y_offset(direction)) == ' '
  end

  def move_one_cell(direction)
    @x += x_offset(direction)
    
    @y += y_offset(direction)
  end

  def x_offset(direction)
    offset(direction)[:x]
  end

  def y_offset(direction)
    offset(direction)[:y]
  end

  def offset(direction)
    case direction
    when :left
      { x: -1, y: 0 }
    when :right
      { x: 1, y: 0 }
    when :up
      { x: 0, y: -1 }
    when :down
      { x: 0, y: 1 }
    end
  end

  def add_one_unit_of_water_to_cell
    @solved_cave.set_cell(@x, @y, '~')
  end
end
