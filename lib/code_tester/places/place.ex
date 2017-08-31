defmodule CodeTester.Places.Place do
  use Ecto.Schema
  import Ecto.Changeset
  alias CodeTester.Places.Place


  schema "places" do
    field :image, :string
    field :name, :string
    field :description, :string
    field :street, :string
    field :city, :string
    field :state, :string
    field :country, :string
    field :zip, :string
    field :latitude, :string
    field :longitude, :string

    timestamps()
  end

  @doc false
  def changeset(%Place{} = place, attrs) do
    place
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
