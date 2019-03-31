defmodule LivedemoWeb.LiveConvert do
  use Phoenix.LiveView
  require Logger

  @default_input """
  struct Video {
    1: string title;
    2: i32 length;
  }

  service Store {
    Video getVideo(1: string title)
  }
  """

  @default_output """
  schema {
  \tquery: Query
  }

  type Query {
  \tgetVideo(title: String): Video
  }

  type Video {
  \ttitle: String
  \tlength: Int
  }
  """

  def render(assigns) do
    LivedemoWeb.PageView.render("index.html", assigns)
  end

  def mount(session, socket) do
    {:ok, assign(socket, input: @default_input, output: @default_output, error: nil)}
  end

  def handle_event("convert", %{"thrift" => thrift}, socket) do
    with {:ok, json} <- ThriftQlEx.parse(thrift),
         {:ok, created_schema} <- ThriftQlEx.print(json) do
      {:noreply, assign(socket, output: created_schema |> String.trim(), error: nil)}
    else
      {:error, {_, _, reason}} ->
        {:noreply, assign(socket, error: "Couldn't parse your schema:\n#{reason}")}

      _ ->
        {:noreply, assign(socket, error: "Couldn't parse your schema")}
    end
  end
end
