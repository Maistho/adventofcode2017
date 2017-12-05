defmodule A3 do
    def find_circle(num) do 
        A3.find_circle(num, 1)
    end
    def find_circle(num, circle) do
        circle_size = A3.circle_size circle
        case circle_size >= num do
            true -> circle
            false -> A3.find_circle num, circle + 1
        end
    end
    
    def circle_width(circle) do
        circle * 2 - 1
    end

    def circle_size(circle) do
        round(:math.pow(A3.circle_width(circle), 2))
    end

    def puzzle(1) do 
        0
    end

    def puzzle(num) do
        circle = A3.find_circle num
        circle_size = A3.circle_size circle
        distance = circle_size - num
        width = A3.circle_width circle
        max_distance = width - 1
        circle - 1 + rem distance + circle - 1, max_distance
    end
end


IO.puts "Advent 3"
input = String.to_integer String.trim IO.gets ""

# Puzzle 1
IO.puts A3.puzzle(input)

# Puzzle 2
# Cheated bc I didn't want to do the maths to calculate the square
# https://oeis.org/A141481/b141481.txt


