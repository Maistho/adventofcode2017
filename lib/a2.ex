defmodule A2 do
    def numbers([], acc) do
        acc
    end
    def numbers(list, acc) do
        {num, tail} = List.pop_at(list, 0)
        A2.numbers tail, acc ++ [String.to_integer(num)]
    end
    def numbers(list) do
        A2.numbers list, []
    end

    def puzzle([""]) do 
        0
    end

    def puzzle(str_list) do
        IO.inspect str_list
        {curr, next} = List.pop_at(str_list, 0)
        str = String.split(curr)
        numbers = A2.numbers(str)
        IO.inspect numbers
        max = Enum.max(numbers)
        min = Enum.min(numbers)
        max - min + A2.puzzle(next)
    end
end


IO.puts "Advent 2"
input = Advent.gets

str = String.split(input, "\n")

# Puzzle 1
IO.puts A2.puzzle(str)

