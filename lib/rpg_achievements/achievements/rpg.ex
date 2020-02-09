defmodule RpgAchievements.Achievements.Rpg do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rpgs" do
    field :created_at, :date
    field :description, :string
    field :name, :string
    has_many :achievements, RpgAchievements.Achievements.Achievement

    timestamps()
  end

  @doc false
  def changeset(rpg, attrs) do
    rpg
    |> cast(attrs, [:name, :created_at, :description])
    |> validate_required([:name, :created_at, :description])
  end
end
