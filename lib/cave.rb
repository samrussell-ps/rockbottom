class Cave
  attr_reader :water

  def initialize(water, cells)
    @water = water
    @cells = cells
  end

  def cell(x, y)
    @cells[y][x]
  end

  def set_cell(x, y, value)
    @cells[y][x] = value
  end

  def to_image
    @cells.map { |cell_row| cell_row.join }.join("\n")
  end

  def water_in_cave
    @cells.reduce(0) { |sum, row| sum + row.count { |cell| cell == '~' } }
  end

  def result_string
    columns = @cells.transpose

    columns.map(&method(:count_water_in_column)).join(' ')
  end

  def count_water_in_column(column)
    column.reduce(0) do |sum, cell| 
      if sum == '~'
        '~'
      elsif cell == '#'
        sum
      elsif cell == '~'
        sum += 1
      elsif cell == ' '
        if sum > 0
          cell = '~'
        else
          sum
        end
      end
    end
  end

  def self.from_string(input_string)
    lines = input_string.split("\n")

    water = lines[0].to_i

    cells = parse_cells(lines[2..-1])

    new(water, cells)
  end

  def self.from_file(file_path)
    file = File.open(file_path)
    input_string = file.read

    from_string(input_string)
  end

  def self.parse_cells(cell_lines)
    cell_lines.map { |cell_line| cell_line.chars }
  end
end
