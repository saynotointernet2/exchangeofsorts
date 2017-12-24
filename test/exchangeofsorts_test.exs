defmodule EOSTest do
  use ExUnit.Case
  doctest EOS

  test "greets the world" do
    assert EOS.hello() == :world
  end
end
