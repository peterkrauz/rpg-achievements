defmodule RpgAchievements.Achievements.Achievement do
  use Ecto.Schema
  import Ecto.Changeset

  schema "achievements" do
    field :completed, :boolean, default: false
    field :description, :string
    belongs_to :rpg, RpgAchievements.Achievements.Rpg

    timestamps()
  end

  @doc false
  def changeset(achievement, attrs) do
    achievement
    |> cast(attrs, [:description, :completed])
    |> validate_required([:description, :completed])
  end
end
