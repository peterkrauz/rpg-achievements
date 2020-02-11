defmodule RpgAchievements.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  {Phoenix.PubSub, [name: RpgAchievements.PubSub, adapter: Phoenix.PubSub.PG2]}

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      RpgAchievementsWeb.Endpoint,
      # Start the Ecto repository
      RpgAchievements.Repo,
      # Starts a worker by calling: RpgAchievements.Worker.start_link(arg)
      # {RpgAchievements.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RpgAchievements.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RpgAchievementsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
