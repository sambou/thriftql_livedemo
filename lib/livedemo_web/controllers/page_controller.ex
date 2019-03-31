defmodule LivedemoWeb.PageController do
  use LivedemoWeb, :controller
  alias Phoenix.LiveView
  import Phoenix.LiveView.Controller

  def index(conn, _params) do
    IO.inspect(%{current_user_id: get_session(conn, :user_id)})

    live_render(conn, LivedemoWeb.LiveConvert,
      session: %{current_user_id: get_session(conn, :user_id)}
    )
  end
end
