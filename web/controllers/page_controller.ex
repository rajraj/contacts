defmodule Contacts.PageController do
  use Contacts.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
