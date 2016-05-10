defmodule ChatExample.RoomChannel do
  require Logger
  use Phoenix.Channel

  intercept ["user_joined"]

  def join("rooms:lobby", _message, socket) do
    Logger.debug "Joining super room"
    {:ok, socket}
  end

  def join("rooms:"<> private_room_id, _params, _socket) do
    IO.puts private_room_id
    {:error, %{reason: "unauthorized"}}

  end

  def handle_in("new_msg", %{"username" => username, "body" => body}, socket) do
    broadcast! socket, "new_msg", %{"username" => username, "body" => body}
    {:noreply, socket}
  end

  def handle_in("user_joined", %{"username" => username}, socket) do
    broadcast! socket, "user_joined", %{"username" => username}
    {:noreply, socket}
  end

  def handle_out("user_joined", msg, socket) do
    Logger.debug "received :data #{inspect msg}"
    push socket, "user_joined", msg
    {:noreply, socket}
  end
end
