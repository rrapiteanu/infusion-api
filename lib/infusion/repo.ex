defmodule Infusion.Repo do
  use Ecto.Repo,
    otp_app: :infusion,
    adapter: Ecto.Adapters.Postgres
end
