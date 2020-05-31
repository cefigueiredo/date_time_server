defmodule DateTimeServerTest do
  use ExUnit.Case
  doctest DateTimeServer

  test "greets the world" do
    assert DateTimeServer.hello() == :world
  end
end
