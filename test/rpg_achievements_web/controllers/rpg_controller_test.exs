defmodule RpgAchievementsWeb.RpgControllerTest do
  use RpgAchievementsWeb.ConnCase

  alias RpgAchievements.Achievements
  alias RpgAchievements.Achievements.Rpg

  @create_attrs %{
    created_at: ~D[2010-04-17],
    description: "some description",
    name: "some name"
  }
  @update_attrs %{
    created_at: ~D[2011-05-18],
    description: "some updated description",
    name: "some updated name"
  }
  @invalid_attrs %{created_at: nil, description: nil, name: nil}

  def fixture(:rpg) do
    {:ok, rpg} = Achievements.create_rpg(@create_attrs)
    rpg
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all rpgs", %{conn: conn} do
      conn = get(conn, Routes.rpg_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create rpg" do
    test "renders rpg when data is valid", %{conn: conn} do
      conn = post(conn, Routes.rpg_path(conn, :create), rpg: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.rpg_path(conn, :show, id))

      assert %{
               "id" => id,
               "created_at" => "2010-04-17",
               "description" => "some description",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.rpg_path(conn, :create), rpg: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update rpg" do
    setup [:create_rpg]

    test "renders rpg when data is valid", %{conn: conn, rpg: %Rpg{id: id} = rpg} do
      conn = put(conn, Routes.rpg_path(conn, :update, rpg), rpg: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.rpg_path(conn, :show, id))

      assert %{
               "id" => id,
               "created_at" => "2011-05-18",
               "description" => "some updated description",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, rpg: rpg} do
      conn = put(conn, Routes.rpg_path(conn, :update, rpg), rpg: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete rpg" do
    setup [:create_rpg]

    test "deletes chosen rpg", %{conn: conn, rpg: rpg} do
      conn = delete(conn, Routes.rpg_path(conn, :delete, rpg))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.rpg_path(conn, :show, rpg))
      end
    end
  end

  defp create_rpg(_) do
    rpg = fixture(:rpg)
    {:ok, rpg: rpg}
  end
end
