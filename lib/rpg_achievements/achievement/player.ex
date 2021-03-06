defmodule RpgAchievements.Achievement.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :name, :string

    many_to_many :achievements, RpgAchievements.Achievements.Achievement, join_through: "completed_achievements"
    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
