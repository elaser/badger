defmodule Badger.MessageCreationService do
  alias Badger.Message

  def call(params) do
    message = Message.changeset(%Message{}, params)
      |> Badger.Repo.insert!

    device_id = message.device_id
    payload = message.body
    topic = message.topic

    Badger.Endpoint.broadcast("device:#{device_id}", topic, payload)
  end

end
