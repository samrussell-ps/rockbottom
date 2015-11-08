class Cave
  attr_reader :water

  def initialize(water, cells)
    @water = water
    @cells = cells
  end

  def cell(x, y)
    @cells[y][x]
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