defmodule ExGeckoTest do
  use ExUnit.Case
  doctest ExGecko

  test "greets the world" do
    assert ExGecko.hello() == :world
  end
end
