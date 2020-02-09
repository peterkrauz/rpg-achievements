defmodule RpgAchievements.Repo.Migrations.CreateRpgs do
  use Ecto.Migration

  def change do
    create table(:rpgs) do
      add :name, :string, size: 128
      add :created_at, :date
      add :description, :string, default: ""

      timestamps()
    end

  end
end
