defmodule Badger.Factory do
  alias Badger.Device

  def create(Device) do
    %Device{
      platform: "iOS",
      version: "10.3.1",
      push_id: "abcdefghijkl",
      is_active: true
    }
  end

  @doc"""
  Creates an instance of the given Ecto Schema module type with the supplied attributes.
  ## Examples
  device = insert(Badger.Device, arg1: "val")
  """
  @spec create(module, Enum.t) :: map
  def create(schema, attributes) do
    schema
    |> create()
    |> struct(attributes)
  end

  @doc"""
  Inserts a new instance of the given Ecto schema module into the Repo
  ## Examples
  device = insert(Badger.Device, arg1: "val")
  """
  @spec insert(module, Enum.t) :: map
  def insert(schema, attributes) do
    Badger.Repo.insert! create(schema, attributes)
  end

end
