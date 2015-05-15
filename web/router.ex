defmodule Contacts.Router do
  use Contacts.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Contacts do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/contacts", ContactController
  end

  # Other scopes may use custom stacks.
  scope "/api", Contacts, as: :api do
    pipe_through :api
    resources "/contacts", ContactController
  end
end
