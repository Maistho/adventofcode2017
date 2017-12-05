defmodule A4 do
    def sort(str_list) do
        Enum.map(str_list, fn(el) -> Enum.sort(String.graphemes(el)) end)
    end
    def puzzle([""]) do 
        0
    end

    def puzzle(str_list) do
        {curr, next} = List.pop_at(str_list, 0)
        curr = String.split(curr)
        # Puzzle 2
        curr = A4.sort(curr) # comment this line to solve for puzzle 1
        IO.inspect curr
        val = case curr -- Enum.uniq(curr) do
            [] -> 1
            _ -> 0
        end
        val + A4.puzzle(next)
    end

    def run do
    IO.puts "Advent 4"
    input = Advent.gets
    input = String.split(input, "\n")

    IO.puts A4.puzzle(input)
    end
end

A4.run