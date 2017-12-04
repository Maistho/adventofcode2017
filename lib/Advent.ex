defmodule Advent do
    def gets do
        input = String.trim IO.gets ""
        case input do
            "" -> input
            _ -> input <> "\n" <> Advent.gets
        end
    end
end