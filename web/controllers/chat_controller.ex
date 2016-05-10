require IEx
defmodule ChatExample.ChatController do
  use ChatExample.Web, :controller

  alias ChatExample.Chat

  def new(conn, _params) do
    changeset = ChatExample.User.changeset(%ChatExample.User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    IO.inspect user_params["username"]
    render(conn, "index.html", username: user_params["username"])
  end
end
