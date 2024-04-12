defmodule Mockix.Repo do
  use Ecto.Repo,
    otp_app: :mockix,
    adapter: Ecto.Adapters.SQLite3
end
