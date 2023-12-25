defmodule EducativeWeb.PageController do
  use EducativeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
