defmodule Badger.Repo.Migrations.AddMessagesTable do
  use Ecto.Migration

  def change do
    create table(:messages) do
        add :status, :integer
        add :body, :map
        add :topic, :string

        add :device_id, references(:devices)

        timestamps()
    end
  end
end
