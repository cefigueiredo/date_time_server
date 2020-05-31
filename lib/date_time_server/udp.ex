defmodule DateTimeServer.UDP do
  use GenServer

  def start_link(port \\ 3000) do
    GenServer.start_link(__MODULE__, port)
  end

  def init(port) do
    {:ok, socket} = :gen_udp.open(port, [:binary, active: true])
  end

  # Handles requests sent to the UDP server
  def handle_info({:udp, r_socket, r_address, r_port, data}, srv_socket) do
    response = data
               |> String.trim()
               |> String.downcase()
               |> CurrentDateTime.format()

    case response do
      datetime ->
        :gen_udp.send(r_socket, r_address, r_port, response)
    end

    {:noreply, srv_socket}
  end
end
