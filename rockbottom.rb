#!/usr/bin/env ruby

require './lib/solver'

cave = Cave.from_file(ARGV.first)
solver = Solver.new(cave)

solution = solver.solution

puts "Solution as string:"
puts ""
puts solution.result_string
puts ""
puts "Solution as map:"
puts solution.to_image
