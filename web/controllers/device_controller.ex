defmodule Badger.DeviceController do
  use Badger.Web, :controller

  alias Badger.{Repo, Device, ErrorView}

  def index(conn, _params) do
    devices = Repo.all(Device)
    render(conn, "index.json", devices: devices)
  end

  def show(conn, %{"id" => id}) do
    with device = %Device{} <- Repo.get(Device, id) do
      render(conn, "show.json", device: device)
    else
      nil ->
        conn
        |> put_status(404)
        |> render(ErrorView, "404.json", error: "Not found")
    end
  end

  def create(conn, params) do
    changeset = Device.changeset(%Device{}, params)

    with {:ok, device} <- Repo.insert(changeset) do
      conn
      |> put_status(201)
      |> render("show.json", device: device)
    else
      {:error, %{errors: errors}} ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", %{errors: errors})
    end
  end

  def delete(conn, %{"id" => id}) do
    with device = %Device{} <- Repo.get(Device, id) do
      Repo.delete!(device)
      conn
      |> put_status(204)
      |> send_resp(:no_content, "")
    else
      nil ->
        conn
        |> put_status(404)
        |> render(ErrorView, "404.json", error: "Not found")
    end
  end
end
