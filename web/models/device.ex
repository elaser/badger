defmodule Badger.Device do
  use Badger.Web, :model

  schema "devices" do
    field :platform, :string
    field :version, :string
    field :push_id, :string
    field :is_active, :boolean

    has_many :messages, Badger.Message

    timestamps()
  end

  @doc """
  Build a changeset based on the `struct` and `params`
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:platform, :version, :push_id, :is_active])
    |> validate_required([:platform, :version, :push_id, :is_active])
  end
end
