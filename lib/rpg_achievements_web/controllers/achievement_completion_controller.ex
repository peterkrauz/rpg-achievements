defmodule RpgAchievementsWeb.AchievementCompletionController do
  use RpgAchievementsWeb, :controller

  alias RpgAchievements.Achievement
  alias RpgAchievements.Achievement.AchievementCompletion

  action_fallback RpgAchievementsWeb.FallbackController

  def index(conn, _params) do
    completed_achievements = Achievement.list_completed_achievements()
    render(conn, "index.json", completed_achievements: completed_achievements)
  end

  def create(conn, %{"achievement_completion" => achievement_completion_params}) do
    with {:ok, %AchievementCompletion{} = achievement_completion} <- Achievement.create_achievement_completion(achievement_completion_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.achievement_completion_path(conn, :show, achievement_completion))
      |> render("show.json", achievement_completion: achievement_completion)
    end
  end

  def show(conn, %{"id" => id}) do
    achievement_completion = Achievement.get_achievement_completion!(id)
    render(conn, "show.json", achievement_completion: achievement_completion)
  end

  def update(conn, %{"id" => id, "achievement_completion" => achievement_completion_params}) do
    achievement_completion = Achievement.get_achievement_completion!(id)

    with {:ok, %AchievementCompletion{} = achievement_completion} <- Achievement.update_achievement_completion(achievement_completion, achievement_completion_params) do
      render(conn, "show.json", achievement_completion: achievement_completion)
    end
  end

  def delete(conn, %{"id" => id}) do
    achievement_completion = Achievement.get_achievement_completion!(id)

    with {:ok, %AchievementCompletion{}} <- Achievement.delete_achievement_completion(achievement_completion) do
      send_resp(conn, :no_content, "")
    end
  end
end
