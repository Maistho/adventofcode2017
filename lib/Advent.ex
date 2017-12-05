defmodule Advent do
    def gets do
        input = IO.gets ""
        input = case input do
            :eof -> ""
            _ -> String.trim input

        end
        case input do
            "" -> input
            _ -> input <> "\n" <> Advent.gets
        end
    end
end