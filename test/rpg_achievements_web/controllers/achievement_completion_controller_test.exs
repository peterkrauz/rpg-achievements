defmodule RpgAchievementsWeb.AchievementCompletionControllerTest do
  use RpgAchievementsWeb.ConnCase

  alias RpgAchievements.Achievement
  alias RpgAchievements.Achievement.AchievementCompletion

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:achievement_completion) do
    {:ok, achievement_completion} = Achievement.create_achievement_completion(@create_attrs)
    achievement_completion
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all completed_achievements", %{conn: conn} do
      conn = get(conn, Routes.achievement_completion_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create achievement_completion" do
    test "renders achievement_completion when data is valid", %{conn: conn} do
      conn = post(conn, Routes.achievement_completion_path(conn, :create), achievement_completion: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.achievement_completion_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.achievement_completion_path(conn, :create), achievement_completion: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update achievement_completion" do
    setup [:create_achievement_completion]

    test "renders achievement_completion when data is valid", %{conn: conn, achievement_completion: %AchievementCompletion{id: id} = achievement_completion} do
      conn = put(conn, Routes.achievement_completion_path(conn, :update, achievement_completion), achievement_completion: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.achievement_completion_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, achievement_completion: achievement_completion} do
      conn = put(conn, Routes.achievement_completion_path(conn, :update, achievement_completion), achievement_completion: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete achievement_completion" do
    setup [:create_achievement_completion]

    test "deletes chosen achievement_completion", %{conn: conn, achievement_completion: achievement_completion} do
      conn = delete(conn, Routes.achievement_completion_path(conn, :delete, achievement_completion))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.achievement_completion_path(conn, :show, achievement_completion))
      end
    end
  end

  defp create_achievement_completion(_) do
    achievement_completion = fixture(:achievement_completion)
    {:ok, achievement_completion: achievement_completion}
  end
end
