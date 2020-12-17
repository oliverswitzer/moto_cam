defmodule MotoCam.WebhookController do
  use MotoCamWeb, :controller

  @topic "movements"
  @pubsub_name :moto_cam
  def update(conn, %{
    "event_type" => "bike_moved",
    "occurred_at" => occured_at,
    "value_1" => movement_type,
    "value_2" => num_degrees,
    "value_3" => _timestamp
  }) do
    movement = %MotoCam.Movement{
      type: movement_type,
      num_degrees: num_degrees,
      occured_at: occured_at
    }

    MotoCamWeb.Endpoint.broadcast_from!(self(), @topic, "new_movement", movement)

    conn
    |> json(%{ok: true})
  end
end
