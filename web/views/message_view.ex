defmodule Badger.MessageView do
  use Badger.Web, :view

  def index("show.json", %{message: message}) do
    render_one(message, Badger.MessageView, "message.json")
  end

  def render("message.json", %{message: message}) do
    %{
      id: message.id,
      status: message.status,
      topic: message.topic,
      body: message.body,
      inserted_at: message.inserted_at,
      updated_at: message.updated_at
    }
  end
end
