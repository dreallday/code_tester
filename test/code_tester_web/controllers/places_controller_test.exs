defmodule CodeTesterWeb.PlacesControllerTest do
  use CodeTesterWeb.ConnCase

  alias CodeTester.Tests
  alias CodeTester.Tests.Places

  @create_attrs %{description: "some description", name: "some name"}
  @update_attrs %{description: "some updated description", name: "some updated name"}
  @invalid_attrs %{description: nil, name: nil}

  def fixture(:places) do
    {:ok, places} = Tests.create_places(@create_attrs)
    places
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all places", %{conn: conn} do
      conn = get conn, places_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create places" do
    test "renders places when data is valid", %{conn: conn} do
      conn = post conn, places_path(conn, :create), places: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, places_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, places_path(conn, :create), places: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update places" do
    setup [:create_places]

    test "renders places when data is valid", %{conn: conn, places: %Places{id: id} = places} do
      conn = put conn, places_path(conn, :update, places), places: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, places_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, places: places} do
      conn = put conn, places_path(conn, :update, places), places: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete places" do
    setup [:create_places]

    test "deletes chosen places", %{conn: conn, places: places} do
      conn = delete conn, places_path(conn, :delete, places)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, places_path(conn, :show, places)
      end
    end
  end

  defp create_places(_) do
    places = fixture(:places)
    {:ok, places: places}
  end
end
