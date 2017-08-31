defmodule CodeTesterWeb.PlaceController do
  use CodeTesterWeb, :controller

  alias CodeTester.Places
  alias CodeTester.Places.Place

  # action_fallback CodeTesterWeb.FallbackController

  def index(conn, params) do
    limit = params["limit"] || "10"
    limit = case Integer.parse(limit) do
      {i, _} -> 
        i
      :error ->
        10
    end
    places = Places.list_places(limit)
    render(conn, "index.json", places: places)
  end


  

  def create(conn, %{"place" => place_params}) do
    with {:ok, %Place{} = place} <- Places.create_place(place_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", place_path(conn, :show, place))
      |> render("show.json", place: place)
    end
  end

  def show(conn, %{"id" => id}) do
    place = Places.get_place!(id)
    render(conn, "show.json", place: place)
  end

  def update(conn, %{"id" => id, "place" => place_params}) do
    place = Places.get_place!(id)

    with {:ok, %Place{} = place} <- Places.update_place(place, place_params) do
      render(conn, "show.json", place: place)
    end
  end

  def delete(conn, %{"id" => id}) do
    place = Places.get_place!(id)
    with {:ok, %Place{}} <- Places.delete_place(place) do
      send_resp(conn, :no_content, "")
    end
  end
end
