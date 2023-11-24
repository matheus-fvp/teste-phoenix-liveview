defmodule TestePdfWeb.ListRelatoriosLive do
  use TestePdfWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(:frase, "Welcome")}
  end

  def handle_event("baixar", _params, socket) do
    {:noreply, update(socket, :frase, &(&1 <> " Matheus"))}
  end

end
