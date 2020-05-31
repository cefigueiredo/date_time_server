defmodule CurrentDateTimeTest do
  use ExUnit.Case
  doctest CurrentDateTime

  test "format(\"invalid\") returns {:error, \"Invalid argument: invalid\"}" do
    assert CurrentDateTime.format("invalid") == {:error, "Invalid argument: invalid"}
  end

  test "format(\"date\") returns current date as iso6801" do
    assert CurrentDateTime.format("date") == "2020-05-30"
  end

  test "format(\"datetime\") returns current datetime as iso6801" do
    assert CurrentDateTime.format("datetime") == "2020-05-30T22:34:10.123456Z"
  end

  test "format(\"time\") returns current time as iso6801" do
    assert CurrentDateTime.format("time") == "22:34:10.123456"
  end
end
