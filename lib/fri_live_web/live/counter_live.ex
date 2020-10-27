defmodule FriLiveWeb.CounterLive do
  use FriLiveWeb, :live_view
  alias Phoenix.PubSub

  @impl true
  def mount(_params, _session, socket) do
    name = "Nobody#{:rand.uniform(100)}"

    if connected?(socket) do
      PubSub.subscribe(FriLive.PubSub, "counter")
    end

    {:ok, assign(socket, count: 0, name: name, messages: [])}
  end

  @impl true
  def handle_event("click", _value, socket) do
    {:noreply, assign(socket, count: count(socket.assigns.count))}
  end

  @impl true
  def handle_event("click_faster", _value, socket) do
    {:noreply, assign(socket, count: count(socket.assigns.count, 0))}
  end

  @impl true
  def handle_event("save", %{"message" => message}, socket) do
    timestamp = Timex.now()

    PubSub.broadcast(
      FriLive.PubSub,
      "counter",
      {:new_message, {socket.assigns.name, timestamp, message}}
    )

    {:noreply,
     assign(socket,
       messages: [{socket.assigns.name, timestamp, message} | socket.assigns.messages]
     )}
  end

  @impl true
  def handle_info(
        {:new_message, {user, _timestamp, _message}},
        %{assigns: %{name: name}} = socket
      )
      when user == name do
    {:noreply, socket}
  end

  def handle_info({:new_message, message}, socket) do
    {:noreply, assign(socket, messages: [message | socket.assigns.messages])}
  end

  defp count(current_count, wait \\ 800) do
    :timer.sleep(wait)
    current_count + 1
  end
end
