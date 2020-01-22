defmodule StoneApiTest do
  use ExUnit.Case
  doctest StoneApi

  test "greets the world" do
    assert StoneApi.hello() == :world
  end
end
