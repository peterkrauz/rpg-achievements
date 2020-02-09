defmodule RpgAchievements.Achievements.Achievement do
  use Ecto.Schema
  import Ecto.Changeset

  schema "achievements" do
    field :completed, :boolean, default: false
    field :description, :string
    belongs_to :rpg, RpgAchievements.Achievements.Rpg

    many_to_many :players, RpgAchievements.Achievement.Player, join_through: "completed_achievements"
    timestamps()
  end

  @doc false
  def changeset(achievement, attrs) do
    achievement
    |> cast(attrs, [:description, :completed])
    |> validate_required([:description, :completed])
  end
end
