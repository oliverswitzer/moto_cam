defmodule MotoCamWeb.PageLive do
  use MotoCamWeb, :live_view

  @topic "movements"

  @impl true
  def mount(_params, _session, socket) do
    MotoCamWeb.Endpoint.subscribe(@topic)
    socket
    |> assign(:movements, [])
    |> ok()
  end

  def handle_info(%_{
    event: "new_movement",
    payload: %MotoCam.Movement{} = movement
  }, socket) do
    socket
    |> assign(:movements, [movement | socket.assigns.movements])
    |> noreply()
  end

  defp ok(socket), do: {:ok, socket}
  defp noreply(socket), do: {:noreply, socket}
end
