defmodule InfusionWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :infusion
  use Absinthe.Phoenix.Endpoint
  use NewRelic.Transaction

  origin =
    case Mix.env() do
      :prod -> ["https://infusion-demo.herokuapp.com"]
      _ -> false
    end

  socket "/socket", InfusionWeb.AbsintheSocket,
    websocket: [check_origin: origin],
    longpoll: true

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug CORSPlug

  plug InfusionWeb.Router
end
