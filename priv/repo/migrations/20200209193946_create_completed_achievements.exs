defmodule RpgAchievements.Repo.Migrations.CreateCompletedAchievements do
  use Ecto.Migration

  def change do
    create table(:completed_achievements) do
      add :player_id, references(:players)
      add :achievement_id, references(:achievements)

      timestamps()
    end

    create unique_index(:completed_achievements, [:player_id, :achievement_id])
  end
end
