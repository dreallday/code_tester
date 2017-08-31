defmodule CodeTesterWeb.Router do
  use CodeTesterWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CodeTesterWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", CodeTesterWeb do
    pipe_through :api

    resources "/places", PlaceController, except: [:new, :create, :edit, :update, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", CodeTesterWeb do
  #   pipe_through :api
  # end
end
