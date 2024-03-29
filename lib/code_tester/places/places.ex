defmodule CodeTester.Places do
  @moduledoc """
  The Places context.
  """

  import Ecto.Query, warn: false
  alias CodeTester.Repo

  alias CodeTester.Places.Place

  @doc """
  Returns the list of places.

  ## Examples

      iex> list_places()
      [%Place{}, ...]

  """
  def list_places(limit) do
    # Repo.all(Place)
    places = for x <- 1..limit do
      %{
        :id => x,
        :image => FakerElixir.Avatar.robohash,
        :name => FakerElixir.App.name,
        :description => FakerElixir.Lorem.sentences(0..5),
        :street => FakerElixir.Address.street_address,
        :city => FakerElixir.Address.city,
        :state => FakerElixir.Address.state,
        # :country => FakerElixir.Address.country,
        :zip => FakerElixir.Address.zip_code,
        :latitude => FakerElixir.Address.latitude,
        :longitude => FakerElixir.Address.longitude
      }
    end
    places
  end

  @doc """
  Gets a single place.

  Raises `Ecto.NoResultsError` if the Place does not exist.

  ## Examples

      iex> get_place!(123)
      %Place{}

      iex> get_place!(456)
      ** (Ecto.NoResultsError)

  """
  def get_place!(id), do: Repo.get!(Place, id)

  @doc """
  Creates a place.

  ## Examples

      iex> create_place(%{field: value})
      {:ok, %Place{}}

      iex> create_place(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_place(attrs \\ %{}) do
    %Place{}
    |> Place.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a place.

  ## Examples

      iex> update_place(place, %{field: new_value})
      {:ok, %Place{}}

      iex> update_place(place, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_place(%Place{} = place, attrs) do
    place
    |> Place.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Place.

  ## Examples

      iex> delete_place(place)
      {:ok, %Place{}}

      iex> delete_place(place)
      {:error, %Ecto.Changeset{}}

  """
  def delete_place(%Place{} = place) do
    Repo.delete(place)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking place changes.

  ## Examples

      iex> change_place(place)
      %Ecto.Changeset{source: %Place{}}

  """
  def change_place(%Place{} = place) do
    Place.changeset(place, %{})
  end
end
