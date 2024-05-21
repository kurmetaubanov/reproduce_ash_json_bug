defmodule ReproduceAshJsonBug.Repo do
  use AshPostgres.Repo, otp_app: :reproduce_ash_json_bug

  def installed_extensions do
    ["uuid-ossp", "citext", "ash-functions"]
  end
end
