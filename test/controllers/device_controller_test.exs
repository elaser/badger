defmodule Badger.DeviceControllerTest do
  use Badger.ApiConnCase, async: true

  import Badger.Router.Helpers, only: [device_path: 2]

  alias Badger.{Factory, Repo, Device}

  def insert_device(params \\ []) do
    Factory.insert(Device, params)
  end

  test "List all devices", %{conn: conn} do
    device_1 = insert_device()
    device_2 = insert_device()

    devices = conn
      |> get(device_path(conn, :index))
      |> Map.get(:resp_body)
      |> Poison.decode!

    assert [
      %{
        id: device_1.id,
        platform: device_1.platform,
        version: device_1.version,
        push_id: device_1.push_id,
        is_active: device_1.is_active,
        inserted_at: NaiveDateTime.to_iso8601(device_1.inserted_at),
        updated_at: NaiveDateTime.to_iso8601(device_1.updated_at)
      },
      %{
        id: device_2.id,
        platform: device_2.platform,
        version: device_2.version,
        push_id: device_2.push_id,
        is_active: device_2.is_active,
        inserted_at: NaiveDateTime.to_iso8601(device_2.inserted_at),
        updated_at: NaiveDateTime.to_iso8601(device_2.updated_at)
      }
    ] == devices
  end
end
