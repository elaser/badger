defmodule Badger.DeviceView do
  use Badger.Web, :view

  def render("index.json", %{devices: devices}) do
    render_many(devices, Badger.DeviceView, "device.json")
  end

  def render("show.json", %{device: device}) do
    render_one(device, Badger.DeviceView, "device.json")
  end

  def render("device.json", %{device: device}) do
    %{
      id: device.id,
      platform: device.platform,
      version: device.version,
      push_id: device.push_id,
      is_active: device.is_active,
      inserted_at: device.inserted_at,
      updated_at: device.updated_at
    }
  end
end
