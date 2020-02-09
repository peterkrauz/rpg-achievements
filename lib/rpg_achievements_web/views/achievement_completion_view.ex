defmodule RpgAchievementsWeb.AchievementCompletionView do
  use RpgAchievementsWeb, :view
  alias RpgAchievementsWeb.AchievementCompletionView

  def render("index.json", %{completed_achievements: completed_achievements}) do
    render_many(completed_achievements, AchievementCompletionView, "achievement_completion.json")
  end

  def render("show.json", %{achievement_completion: achievement_completion}) do
    render_one(achievement_completion, AchievementCompletionView, "achievement_completion.json")
  end

  def render("achievement_completion.json", %{achievement_completion: achievement_completion}) do
    %{id: achievement_completion.id}
  end
end
