defmodule RpgAchievements.Repo.Migrations.AddTitleToAchievement do
  use Ecto.Migration

  def change do
    alter table(:achievements) do
      add :title, :string, size: 64
    end
  end
end
