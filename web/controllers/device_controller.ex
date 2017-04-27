defmodule Badger.DeviceController do
  use Badger.Web, :controller

  alias Badger.{Repo, Device}

  def index(conn, _params) do
    devices = Repo.all(Device)
    render(conn, "index.json", devices: devices)
  end
end
