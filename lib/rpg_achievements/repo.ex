defmodule RpgAchievements.Repo do
  use Ecto.Repo,
    otp_app: :rpg_achievements,
    adapter: Ecto.Adapters.Postgres
end
