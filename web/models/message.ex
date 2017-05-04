defmodule Badger.Message do
  use Badger.Web, :model

  schema "messages" do
    field :status, :integer
    field :body, :map
    field :topic, :string

    belongs_to :device, Badger.Device

    timestamps()
  end

  @doc """
  Build a changeset based on params
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:status, :body, :device_id, :topic])
    |> validate_required([:status, :body, :topic])
    |> foreign_key_constraint(:device_id)
  end
end
