defmodule RpgAchievements.Achievement.AchievementCompletion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "completed_achievements" do
    
    timestamps()
  end

  @doc false
  def changeset(achievement_completion, attrs) do
    achievement_completion
    |> cast(attrs, [])
    |> validate_required([])
  end
end
