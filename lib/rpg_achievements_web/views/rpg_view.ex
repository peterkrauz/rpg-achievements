defmodule RpgAchievementsWeb.RpgView do
  use RpgAchievementsWeb, :view
  alias RpgAchievementsWeb.RpgView

  def render("index.json", %{rpgs: rpgs}) do
    render_many(rpgs, RpgView, "rpg.json")
  end

  def render("show.json", %{rpg: rpg}) do
    render_one(rpg, RpgView, "rpg.json")
  end

  def render("rpg.json", %{rpg: rpg}) do
    %{id: rpg.id,
      name: rpg.name,
      created_at: rpg.created_at,
      description: rpg.description}
  end
end
