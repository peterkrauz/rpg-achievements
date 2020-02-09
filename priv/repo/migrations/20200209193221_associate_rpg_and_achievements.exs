defmodule RpgAchievements.Repo.Migrations.AssociateRpgAndAchievements do
  use Ecto.Migration

  def change do
    alter table(:achievements) do
      remove :rpg_id
      add :rpg_id, references(:rpgs)
    end
  end
end
