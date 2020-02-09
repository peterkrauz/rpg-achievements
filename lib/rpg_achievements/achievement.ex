defmodule RpgAchievements.Achievement do
  @moduledoc """
  The Achievement context.
  """

  import Ecto.Query, warn: false
  alias RpgAchievements.Repo

  alias RpgAchievements.Achievement.Player

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Player{}, ...]

  """
  def list_players do
    Repo.all(Player)
  end

  @doc """
  Gets a single player.

  Raises `Ecto.NoResultsError` if the Player does not exist.

  ## Examples

      iex> get_player!(123)
      %Player{}

      iex> get_player!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player!(id), do: Repo.get!(Player, id)

  @doc """
  Creates a player.

  ## Examples

      iex> create_player(%{field: value})
      {:ok, %Player{}}

      iex> create_player(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player(attrs \\ %{}) do
    %Player{}
    |> Player.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player.

  ## Examples

      iex> update_player(player, %{field: new_value})
      {:ok, %Player{}}

      iex> update_player(player, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player(%Player{} = player, attrs) do
    player
    |> Player.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player.

  ## Examples

      iex> delete_player(player)
      {:ok, %Player{}}

      iex> delete_player(player)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player(%Player{} = player) do
    Repo.delete(player)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player changes.

  ## Examples

      iex> change_player(player)
      %Ecto.Changeset{data: %Player{}}

  """
  def change_player(%Player{} = player) do
    Player.changeset(player, %{})
  end

  alias RpgAchievements.Achievement.AchievementCompletion

  @doc """
  Returns the list of completed_achievements.

  ## Examples

      iex> list_completed_achievements()
      [%AchievementCompletion{}, ...]

  """
  def list_completed_achievements do
    Repo.all(AchievementCompletion)
  end

  @doc """
  Gets a single achievement_completion.

  Raises `Ecto.NoResultsError` if the Achievement completion does not exist.

  ## Examples

      iex> get_achievement_completion!(123)
      %AchievementCompletion{}

      iex> get_achievement_completion!(456)
      ** (Ecto.NoResultsError)

  """
  def get_achievement_completion!(id), do: Repo.get!(AchievementCompletion, id)

  @doc """
  Creates a achievement_completion.

  ## Examples

      iex> create_achievement_completion(%{field: value})
      {:ok, %AchievementCompletion{}}

      iex> create_achievement_completion(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_achievement_completion(attrs \\ %{}) do
    %AchievementCompletion{}
    |> AchievementCompletion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a achievement_completion.

  ## Examples

      iex> update_achievement_completion(achievement_completion, %{field: new_value})
      {:ok, %AchievementCompletion{}}

      iex> update_achievement_completion(achievement_completion, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_achievement_completion(%AchievementCompletion{} = achievement_completion, attrs) do
    achievement_completion
    |> AchievementCompletion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a achievement_completion.

  ## Examples

      iex> delete_achievement_completion(achievement_completion)
      {:ok, %AchievementCompletion{}}

      iex> delete_achievement_completion(achievement_completion)
      {:error, %Ecto.Changeset{}}

  """
  def delete_achievement_completion(%AchievementCompletion{} = achievement_completion) do
    Repo.delete(achievement_completion)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking achievement_completion changes.

  ## Examples

      iex> change_achievement_completion(achievement_completion)
      %Ecto.Changeset{data: %AchievementCompletion{}}

  """
  def change_achievement_completion(%AchievementCompletion{} = achievement_completion) do
    AchievementCompletion.changeset(achievement_completion, %{})
  end
end
