defmodule InfusionWeb.Router do
  use Phoenix.Router

  pipeline :api do
    plug InfusionWeb.Context
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: InfusionWeb.Schema, interface: :playground

    forward "/", Absinthe.Plug, schema: InfusionWeb.Schema
  end
end
