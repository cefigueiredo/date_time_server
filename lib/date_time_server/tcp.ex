defmodule DateTimeServer.TCP do
  use GenServer

  def start_link(port \\ 3000) do
    GenServer.start_link(__MODULE__, port)
  end

  def init(port) do
    {:ok, socket} = :gen_tcp.listen(port, [:binary, active: true])
    loop_client(socket)

    {:ok, socket}
  end

  defp loop_client(socket) do
    {:ok, client_socket} = :gen_tcp.accept(socket)
    {:ok, pid} = DateTimeServer.TCP.Worker.start(client_socket)

    :gen_tcp.controlling_process(client_socket, pid)
    loop_client(socket)
  end
end
