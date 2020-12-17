defmodule MotoCam.Repo do
  use Ecto.Repo,
    otp_app: :moto_cam,
    adapter: Ecto.Adapters.Postgres
end
