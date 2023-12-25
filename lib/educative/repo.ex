defmodule Educative.Repo do
  use Ecto.Repo,
    otp_app: :educative,
    adapter: Ecto.Adapters.Postgres
end
