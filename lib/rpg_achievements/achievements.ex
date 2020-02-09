defmodule RpgAchievements.Achievements do
  @moduledoc """
  The Achievements context.
  """

  import Ecto.Query, warn: false
  alias RpgAchievements.Repo

  alias RpgAchievements.Achievements.Rpg

  @doc """
  Returns the list of rpgs.

  ## Examples

      iex> list_rpgs()
      [%Rpg{}, ...]

  """
  def list_rpgs do
    Repo.all(Rpg)
  end

  @doc """
  Gets a single rpg.

  Raises `Ecto.NoResultsError` if the Rpg does not exist.

  ## Examples

      iex> get_rpg!(123)
      %Rpg{}

      iex> get_rpg!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rpg!(id), do: Repo.get!(Rpg, id)

  @doc """
  Creates a rpg.

  ## Examples

      iex> create_rpg(%{field: value})
      {:ok, %Rpg{}}

      iex> create_rpg(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rpg(attrs \\ %{}) do
    %Rpg{}
    |> Rpg.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rpg.

  ## Examples

      iex> update_rpg(rpg, %{field: new_value})
      {:ok, %Rpg{}}

      iex> update_rpg(rpg, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rpg(%Rpg{} = rpg, attrs) do
    rpg
    |> Rpg.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a rpg.

  ## Examples

      iex> delete_rpg(rpg)
      {:ok, %Rpg{}}

      iex> delete_rpg(rpg)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rpg(%Rpg{} = rpg) do
    Repo.delete(rpg)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rpg changes.

  ## Examples

      iex> change_rpg(rpg)
      %Ecto.Changeset{data: %Rpg{}}

  """
  def change_rpg(%Rpg{} = rpg) do
    Rpg.changeset(rpg, %{})
  end

  alias RpgAchievements.Achievements.Achievement

  @doc """
  Returns the list of achievements.

  ## Examples

      iex> list_achievements()
      [%Achievement{}, ...]

  """
  def list_achievements do
    Repo.all(Achievement)
  end

  @doc """
  Gets a single achievement.

  Raises `Ecto.NoResultsError` if the Achievement does not exist.

  ## Examples

      iex> get_achievement!(123)
      %Achievement{}

      iex> get_achievement!(456)
      ** (Ecto.NoResultsError)

  """
  def get_achievement!(id), do: Repo.get!(Achievement, id)

  @doc """
  Creates a achievement.

  ## Examples

      iex> create_achievement(%{field: value})
      {:ok, %Achievement{}}

      iex> create_achievement(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_achievement(attrs \\ %{}) do
    %Achievement{}
    |> Achievement.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a achievement.

  ## Examples

      iex> update_achievement(achievement, %{field: new_value})
      {:ok, %Achievement{}}

      iex> update_achievement(achievement, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_achievement(%Achievement{} = achievement, attrs) do
    achievement
    |> Achievement.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a achievement.

  ## Examples

      iex> delete_achievement(achievement)
      {:ok, %Achievement{}}

      iex> delete_achievement(achievement)
      {:error, %Ecto.Changeset{}}

  """
  def delete_achievement(%Achievement{} = achievement) do
    Repo.delete(achievement)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking achievement changes.

  ## Examples

      iex> change_achievement(achievement)
      %Ecto.Changeset{data: %Achievement{}}

  """
  def change_achievement(%Achievement{} = achievement) do
    Achievement.changeset(achievement, %{})
  end
end
