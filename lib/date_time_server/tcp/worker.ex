defmodule DateTimeServer.TCP.Worker do
  use GenServer

  def start(socket) do
    GenServer.start(__MODULE__, socket)
  end

  def init(socket) do
    timer = Process.send_after(self(), :timeout, 5_000)

    {:ok, %{socket: socket, timer: timer}}
  end

  def terminate(_reason, state) do
    :gen_tcp.close(state[:socket])
  end

  def handle_info({:tcp, cli_socket, message}, state) do
    state = %{state | timer: reset_timer(state[:timer])}

    process_message(message, state)
  end

  def handle_info(:timeout, state) do
    :gen_tcp.close(state[:socket])

    {:stop, {:shutdown, :timeout}}
  end

  defp process_message(message, state) do
    format = message
             |> String.trim
             |> String.downcase

    case CurrentDateTime.format(format) do
      {:error, msg} ->
        {:stop, msg, state}

      datetime ->
        :gen_tcp.send(state[:socket], datetime)

        {:noreply, state}
    end
  end

  defp reset_timer(timer) do
    Process.cancel_timer(timer)

    timer = Process.send_after(self(), :timeout, 5_000)
  end
end
