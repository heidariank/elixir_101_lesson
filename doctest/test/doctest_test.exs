defmodule DoctestTest do
  use ExUnit.Case
  doctest Doctest

  test "greets the world" do
    assert Doctest.hello() == :world
  end
end
