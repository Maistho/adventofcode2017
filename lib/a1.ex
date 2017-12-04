defmodule A1 do
  def puzzle(_, n, _) when n <= -1 do
    0
  end


  def puzzle(str, n, compare_distance) do
    l = String.length(str)
    compare_position = rem(n + compare_distance, l)
    n1 = String.to_integer(String.at(str, n))
    n2 = String.to_integer(String.at(str, compare_position))
    next = A1.puzzle(str, n - 1, compare_distance)
    case n1 == n2 do
      true ->
        n1 + next

      _ ->
        next
    end
  end
end

input = IO.gets("")
input = String.trim(input)
length = String.length(input)

# Puzzle 1
#IO.puts A1.puzzle(input, length - 1, 1)

# Puzzle 2
compare_distance = Integer.floor_div(length, 2)
IO.puts A1.puzzle(input, length - 1, compare_distance)
