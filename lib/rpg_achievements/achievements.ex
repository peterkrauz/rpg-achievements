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
end
