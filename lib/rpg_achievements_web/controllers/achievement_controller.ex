defmodule RpgAchievementsWeb.AchievementController do
  use RpgAchievementsWeb, :controller

  alias RpgAchievements.Achievements
  alias RpgAchievements.Achievements.Achievement

  action_fallback RpgAchievementsWeb.FallbackController

  def index(conn, _params) do
    achievements = Achievements.list_achievements()
    render(conn, "index.json", achievements: achievements)
  end

  def create(conn, %{"achievement" => achievement_params}) do
    with {:ok, %Achievement{} = achievement} <- Achievements.create_achievement(achievement_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.achievement_path(conn, :show, achievement))
      |> render("show.json", achievement: achievement)
    end
  end

  def show(conn, %{"id" => id}) do
    achievement = Achievements.get_achievement!(id)
    render(conn, "show.json", achievement: achievement)
  end

  def update(conn, %{"id" => id, "achievement" => achievement_params}) do
    achievement = Achievements.get_achievement!(id)

    with {:ok, %Achievement{} = achievement} <- Achievements.update_achievement(achievement, achievement_params) do
      render(conn, "show.json", achievement: achievement)
    end
  end

  def delete(conn, %{"id" => id}) do
    achievement = Achievements.get_achievement!(id)

    with {:ok, %Achievement{}} <- Achievements.delete_achievement(achievement) do
      send_resp(conn, :no_content, "")
    end
  end
end
