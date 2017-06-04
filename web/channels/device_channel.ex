defmodule Badger.DeviceChannel do
  use Badger.Web, :channel

  def join("device:" <> device_id, payload, socket) do
    if authorized?(device_id, payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in(event, payload, socket) do
    IO.inspect(event)
    IO.inspect(payload)

    handle_payload(payload)

    {:reply, {:ok, payload}, socket}
  end

  intercept ["new_msg"]
  def handle_out(event, payload, socket) do
    IO.puts("in handle_out")
    IO.inspect(event)
    IO.inspect(payload)
    push socket, event, payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_device_id, _payload) do
    true
  end

  # Given a incoming payload, take an action on it
  defp handle_payload(_payload) do
    # action = payload.action
  end
end
