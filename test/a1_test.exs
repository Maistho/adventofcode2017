defmodule A1Test do
  use ExUnit.Case
  doctest A1

  test "greets the world" do
    assert A1.hello() == :world
  end
end
