defmodule DateTimeServer do
  use Application

  def start(_type, _args) do
    port = String.to_integer(System.get_env("PORT") || "3333")

    children = [
      {DateTimeServer.UDP, port},
      {DateTimeServer.TCP, port}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
