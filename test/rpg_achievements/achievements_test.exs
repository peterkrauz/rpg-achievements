defmodule RpgAchievements.AchievementsTest do
  use RpgAchievements.DataCase

  alias RpgAchievements.Achievements

  describe "rpgs" do
    alias RpgAchievements.Achievements.Rpg

    @valid_attrs %{created_at: ~D[2010-04-17], description: "some description", name: "some name"}
    @update_attrs %{created_at: ~D[2011-05-18], description: "some updated description", name: "some updated name"}
    @invalid_attrs %{created_at: nil, description: nil, name: nil}

    def rpg_fixture(attrs \\ %{}) do
      {:ok, rpg} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Achievements.create_rpg()

      rpg
    end

    test "list_rpgs/0 returns all rpgs" do
      rpg = rpg_fixture()
      assert Achievements.list_rpgs() == [rpg]
    end

    test "get_rpg!/1 returns the rpg with given id" do
      rpg = rpg_fixture()
      assert Achievements.get_rpg!(rpg.id) == rpg
    end

    test "create_rpg/1 with valid data creates a rpg" do
      assert {:ok, %Rpg{} = rpg} = Achievements.create_rpg(@valid_attrs)
      assert rpg.created_at == ~D[2010-04-17]
      assert rpg.description == "some description"
      assert rpg.name == "some name"
    end

    test "create_rpg/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Achievements.create_rpg(@invalid_attrs)
    end

    test "update_rpg/2 with valid data updates the rpg" do
      rpg = rpg_fixture()
      assert {:ok, %Rpg{} = rpg} = Achievements.update_rpg(rpg, @update_attrs)
      assert rpg.created_at == ~D[2011-05-18]
      assert rpg.description == "some updated description"
      assert rpg.name == "some updated name"
    end

    test "update_rpg/2 with invalid data returns error changeset" do
      rpg = rpg_fixture()
      assert {:error, %Ecto.Changeset{}} = Achievements.update_rpg(rpg, @invalid_attrs)
      assert rpg == Achievements.get_rpg!(rpg.id)
    end

    test "delete_rpg/1 deletes the rpg" do
      rpg = rpg_fixture()
      assert {:ok, %Rpg{}} = Achievements.delete_rpg(rpg)
      assert_raise Ecto.NoResultsError, fn -> Achievements.get_rpg!(rpg.id) end
    end

    test "change_rpg/1 returns a rpg changeset" do
      rpg = rpg_fixture()
      assert %Ecto.Changeset{} = Achievements.change_rpg(rpg)
    end
  end

  describe "achievements" do
    alias RpgAchievements.Achievements.Achievement

    @valid_attrs %{completed: true, description: "some description"}
    @update_attrs %{completed: false, description: "some updated description"}
    @invalid_attrs %{completed: nil, description: nil}

    def achievement_fixture(attrs \\ %{}) do
      {:ok, achievement} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Achievements.create_achievement()

      achievement
    end

    test "list_achievements/0 returns all achievements" do
      achievement = achievement_fixture()
      assert Achievements.list_achievements() == [achievement]
    end

    test "get_achievement!/1 returns the achievement with given id" do
      achievement = achievement_fixture()
      assert Achievements.get_achievement!(achievement.id) == achievement
    end

    test "create_achievement/1 with valid data creates a achievement" do
      assert {:ok, %Achievement{} = achievement} = Achievements.create_achievement(@valid_attrs)
      assert achievement.completed == true
      assert achievement.description == "some description"
    end

    test "create_achievement/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Achievements.create_achievement(@invalid_attrs)
    end

    test "update_achievement/2 with valid data updates the achievement" do
      achievement = achievement_fixture()
      assert {:ok, %Achievement{} = achievement} = Achievements.update_achievement(achievement, @update_attrs)
      assert achievement.completed == false
      assert achievement.description == "some updated description"
    end

    test "update_achievement/2 with invalid data returns error changeset" do
      achievement = achievement_fixture()
      assert {:error, %Ecto.Changeset{}} = Achievements.update_achievement(achievement, @invalid_attrs)
      assert achievement == Achievements.get_achievement!(achievement.id)
    end

    test "delete_achievement/1 deletes the achievement" do
      achievement = achievement_fixture()
      assert {:ok, %Achievement{}} = Achievements.delete_achievement(achievement)
      assert_raise Ecto.NoResultsError, fn -> Achievements.get_achievement!(achievement.id) end
    end

    test "change_achievement/1 returns a achievement changeset" do
      achievement = achievement_fixture()
      assert %Ecto.Changeset{} = Achievements.change_achievement(achievement)
    end
  end
end
