defmodule DateTimeServer do
  use Application

  def start(_type, args) do
    children = [
      {DateTimeServer.UDP, :start_link, args[:port]},
      {DateTimeServer.TCP, :start_link, args[:port]}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
