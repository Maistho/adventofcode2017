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

    def abs_rem(a, b) do
        {small, big} = Enum.min_max([a, b])
        rem(big, small)
    end

    def divisible([]) do
        throw Error
    end

    def divisible(num_list) do
        {curr, next} = List.pop_at(num_list, 0)
        case Enum.find(next, nil, fn(el) -> A2.abs_rem(curr, el) == 0 end) do
            nil -> A2.divisible next
            el -> Enum.min_max([curr, el])
        end

    end

    def puzzle([""]) do 
        0
    end

    def puzzle(str_list) do
        {curr, next} = List.pop_at(str_list, 0)
        str = String.split(curr)
        numbers = A2.numbers(str)
        {min, max} = Enum.min_max(numbers)
        max - min + A2.puzzle(next)
    end

    def puzzle2([""]) do 
        0
    end

    def puzzle2(str_list) do
        {curr, next} = List.pop_at(str_list, 0)
        str = String.split(curr)
        numbers = A2.numbers(str)
        {small, big} = A2.divisible numbers
        Integer.floor_div(big, small) + A2.puzzle2(next)
    end
end


IO.puts "Advent 2"
input = Advent.gets

str = String.split(input, "\n")

# Puzzle 1
# IO.puts A2.puzzle(str)

# Puzzle 2
IO.puts A2.puzzle2(str)

