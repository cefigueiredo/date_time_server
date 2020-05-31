defmodule CurrentDateTime do
  @moduledoc """
    Group functions to format a %DateTime.t and return its iso8601 representation.
  """

  @doc """
  Returns a string representing the iso8601 date | time | datetime.

  ## Examples

      iex> CurrentDateTime.format("date")
      "2020-05-30"
      iex> CurrentDateTime.format("time")
      "22:34:10.123456"
      iex> CurrentDateTime.format("datetime")
      "2020-05-30T22:34:10.123456Z"

  """
  @spec format(String.t()) :: String.t()
  def format("date") do
    current_datetime()
    |> Date.to_iso8601()
  end

  def format("time") do
    current_datetime()
    |> Time.to_iso8601()
  end

  def format("datetime") do
    current_datetime()
    |> DateTime.to_iso8601()
  end

  defp current_datetime do
    case Mix.env() do
      :test ->
        {:ok, datetime, _} = DateTime.from_iso8601("2020-05-30T22:34:10.123456Z")
        datetime

      _ ->
        DateTime.utc_now()
    end
  end
end
