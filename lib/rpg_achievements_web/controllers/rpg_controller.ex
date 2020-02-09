defmodule RpgAchievementsWeb.RpgController do
  use RpgAchievementsWeb, :controller

  alias RpgAchievements.Achievements
  alias RpgAchievements.Achievements.Rpg

  action_fallback RpgAchievementsWeb.FallbackController

  def index(conn, _params) do
    rpgs = Achievements.list_rpgs()
    render(conn, "index.json", rpgs: rpgs)
  end

  def create(conn, %{"rpg" => rpg_params}) do
    with {:ok, %Rpg{} = rpg} <- Achievements.create_rpg(rpg_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.rpg_path(conn, :show, rpg))
      |> render("show.json", rpg: rpg)
    end
  end

  def show(conn, %{"id" => id}) do
    rpg = Achievements.get_rpg!(id)
    render(conn, "show.json", rpg: rpg)
  end

  def update(conn, %{"id" => id, "rpg" => rpg_params}) do
    rpg = Achievements.get_rpg!(id)

    with {:ok, %Rpg{} = rpg} <- Achievements.update_rpg(rpg, rpg_params) do
      render(conn, "show.json", rpg: rpg)
    end
  end

  def delete(conn, %{"id" => id}) do
    rpg = Achievements.get_rpg!(id)

    with {:ok, %Rpg{}} <- Achievements.delete_rpg(rpg) do
      send_resp(conn, :no_content, "")
    end
  end
end
