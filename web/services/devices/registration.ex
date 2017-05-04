defmodule Badger.DeviceRegistrationService do
  alias Badger.Device

  def call(params) do
    {:error, device} = Device.changeset(%Device{} ,params)
      |> Repo.insert
    device
  end

end
