defmodule RpgAchievements.Repo.Migrations.CreateAchievements do
  use Ecto.Migration

  def change do
    create table(:achievements) do
      add :rpg_id, :int, null: false
      add :description, :string
      add :completed, :boolean, default: false, null: false

      timestamps()
    end
  end
end
