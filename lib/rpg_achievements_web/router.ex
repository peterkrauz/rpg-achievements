defmodule RpgAchievementsWeb.Router do
  use RpgAchievementsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RpgAchievementsWeb do
    pipe_through :api

    resources "/rpgs", RpgController, except: [:create, :update, :delete, :new, :edit]
    resources "/players", PlayerController, except: [:create, :update, :delete, :new, :edit]
    resources "/achievements", AchievementController, except: [:create, :update, :delete, :new, :edit]
  end
end
