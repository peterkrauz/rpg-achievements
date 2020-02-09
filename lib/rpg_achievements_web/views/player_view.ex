defmodule RpgAchievementsWeb.PlayerView do
  use RpgAchievementsWeb, :view
  alias RpgAchievementsWeb.PlayerView

  def render("index.json", %{players: players}) do
    render_many(players, PlayerView, "player.json")
  end

  def render("show.json", %{player: player}) do
    render_one(player, PlayerView, "player.json")
  end

  def render("player.json", %{player: player}) do
    %{id: player.id,
      name: player.name}
  end
end
