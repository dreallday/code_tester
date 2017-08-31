defmodule CodeTesterWeb.PageController do
  use CodeTesterWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
