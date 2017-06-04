defmodule Badger.MessageController do
  use Badger.Web, :controller

  alias Badger.{Repo, Message, ErrorView}

  def create(conn, params) do
    changeset = Message.changeset(%Message{}, params)


    with {:ok, message} <- Repo.insert(changeset) do
      conn
      |> put_status(201)
      |> render("show.json", message: message)
    else
      {:error, %{errors: errors}} ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", %{errors: errors})
    end

  end
end
