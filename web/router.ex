defmodule Badger.Router do
  use Badger.Web, :router

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

  scope "/", Badger do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Badger do
    pipe_through :api

    get "/devices", DeviceController, :index
    get "/devices/:id", DeviceController, :show
    post "/devices", DeviceController, :create
    delete "/devices/:id", DeviceController, :delete
    post "/messages", MessageController, :create
  end
end
