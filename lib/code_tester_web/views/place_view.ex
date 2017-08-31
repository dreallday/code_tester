defmodule CodeTesterWeb.PlaceView do
  use CodeTesterWeb, :view
  alias CodeTesterWeb.PlaceView

  def render("index.json", %{places: places, count: count}) do
    %{
      count: count,
      data: render_many(places, PlaceView, "place.json")
    }
  end

  def render("show.json", %{place: place}) do
    %{data: render_one(place, PlaceView, "place.json")}
  end

  def render("place.json", %{place: place}) do
    %{
      id: place.id,
      name: place.name,
      image: place.image,
      description: place.description,
      street: place.street,
      city: place.city,
      state: place.state,
      # country: place.country,
      zip: place.zip,
      latitude: place.latitude,
      longitude: place.longitude,
    }
  end
end
