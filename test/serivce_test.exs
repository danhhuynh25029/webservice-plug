defmodule SerivceTest do
  use ExUnit.Case
  doctest Serivce

  test "greets the world" do
    assert Serivce.hello() == :world
  end
end
