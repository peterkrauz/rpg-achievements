defmodule RpgAchievements.AchievementTest do
  use RpgAchievements.DataCase

  alias RpgAchievements.Achievement

  describe "players" do
    alias RpgAchievements.Achievement.Player

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def player_fixture(attrs \\ %{}) do
      {:ok, player} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Achievement.create_player()

      player
    end

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert Achievement.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Achievement.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      assert {:ok, %Player{} = player} = Achievement.create_player(@valid_attrs)
      assert player.name == "some name"
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Achievement.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      assert {:ok, %Player{} = player} = Achievement.update_player(player, @update_attrs)
      assert player.name == "some updated name"
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Achievement.update_player(player, @invalid_attrs)
      assert player == Achievement.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Achievement.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Achievement.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Achievement.change_player(player)
    end
  end

  describe "completed_achievements" do
    alias RpgAchievements.Achievement.AchievementCompletion

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def achievement_completion_fixture(attrs \\ %{}) do
      {:ok, achievement_completion} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Achievement.create_achievement_completion()

      achievement_completion
    end

    test "list_completed_achievements/0 returns all completed_achievements" do
      achievement_completion = achievement_completion_fixture()
      assert Achievement.list_completed_achievements() == [achievement_completion]
    end

    test "get_achievement_completion!/1 returns the achievement_completion with given id" do
      achievement_completion = achievement_completion_fixture()
      assert Achievement.get_achievement_completion!(achievement_completion.id) == achievement_completion
    end

    test "create_achievement_completion/1 with valid data creates a achievement_completion" do
      assert {:ok, %AchievementCompletion{} = achievement_completion} = Achievement.create_achievement_completion(@valid_attrs)
    end

    test "create_achievement_completion/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Achievement.create_achievement_completion(@invalid_attrs)
    end

    test "update_achievement_completion/2 with valid data updates the achievement_completion" do
      achievement_completion = achievement_completion_fixture()
      assert {:ok, %AchievementCompletion{} = achievement_completion} = Achievement.update_achievement_completion(achievement_completion, @update_attrs)
    end

    test "update_achievement_completion/2 with invalid data returns error changeset" do
      achievement_completion = achievement_completion_fixture()
      assert {:error, %Ecto.Changeset{}} = Achievement.update_achievement_completion(achievement_completion, @invalid_attrs)
      assert achievement_completion == Achievement.get_achievement_completion!(achievement_completion.id)
    end

    test "delete_achievement_completion/1 deletes the achievement_completion" do
      achievement_completion = achievement_completion_fixture()
      assert {:ok, %AchievementCompletion{}} = Achievement.delete_achievement_completion(achievement_completion)
      assert_raise Ecto.NoResultsError, fn -> Achievement.get_achievement_completion!(achievement_completion.id) end
    end

    test "change_achievement_completion/1 returns a achievement_completion changeset" do
      achievement_completion = achievement_completion_fixture()
      assert %Ecto.Changeset{} = Achievement.change_achievement_completion(achievement_completion)
    end
  end
end
