defmodule CodeTester.TestsTest do
  use CodeTester.DataCase

  alias CodeTester.Tests

  describe "places" do
    alias CodeTester.Tests.Places

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def places_fixture(attrs \\ %{}) do
      {:ok, places} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tests.create_places()

      places
    end

    test "list_places/0 returns all places" do
      places = places_fixture()
      assert Tests.list_places() == [places]
    end

    test "get_places!/1 returns the places with given id" do
      places = places_fixture()
      assert Tests.get_places!(places.id) == places
    end

    test "create_places/1 with valid data creates a places" do
      assert {:ok, %Places{} = places} = Tests.create_places(@valid_attrs)
      assert places.description == "some description"
      assert places.name == "some name"
    end

    test "create_places/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tests.create_places(@invalid_attrs)
    end

    test "update_places/2 with valid data updates the places" do
      places = places_fixture()
      assert {:ok, places} = Tests.update_places(places, @update_attrs)
      assert %Places{} = places
      assert places.description == "some updated description"
      assert places.name == "some updated name"
    end

    test "update_places/2 with invalid data returns error changeset" do
      places = places_fixture()
      assert {:error, %Ecto.Changeset{}} = Tests.update_places(places, @invalid_attrs)
      assert places == Tests.get_places!(places.id)
    end

    test "delete_places/1 deletes the places" do
      places = places_fixture()
      assert {:ok, %Places{}} = Tests.delete_places(places)
      assert_raise Ecto.NoResultsError, fn -> Tests.get_places!(places.id) end
    end

    test "change_places/1 returns a places changeset" do
      places = places_fixture()
      assert %Ecto.Changeset{} = Tests.change_places(places)
    end
  end
end
