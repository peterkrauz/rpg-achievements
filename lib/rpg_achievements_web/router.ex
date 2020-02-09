defmodule RpgAchievementsWeb.Router do
  use RpgAchievementsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RpgAchievementsWeb do
    pipe_through :api

    resources "/rpgs", RpgController, except: [:new, :edit]
    resources "/players", PlayerController, except: [:new, :edit]
    resources "/achievements", AchievementController, except: [:new, :edit]
  end
end
