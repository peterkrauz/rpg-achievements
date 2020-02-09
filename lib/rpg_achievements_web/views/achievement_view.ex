defmodule RpgAchievementsWeb.AchievementView do
  use RpgAchievementsWeb, :view
  alias RpgAchievementsWeb.AchievementView

  def render("index.json", %{achievements: achievements}) do
    render_many(achievements, AchievementView, "achievement.json")
  end

  def render("show.json", %{achievement: achievement}) do
    render_one(achievement, AchievementView, "achievement.json")
  end

  def render("achievement.json", %{achievement: achievement}) do
    %{id: achievement.id,
      description: achievement.description,
      completed: achievement.completed}
  end
end
