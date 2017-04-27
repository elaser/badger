defmodule Badger.Repo.Migrations.CreateDevice do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :platform, :string
      add :version, :string
      add :push_id, :string
      add :is_active, :boolean, default: true


      timestamps()
    end
  end
end
