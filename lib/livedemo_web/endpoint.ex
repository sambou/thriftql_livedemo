defmodule LivedemoWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :livedemo

  socket "/socket", LivedemoWeb.UserSocket,
    websocket: [check_origin: ["//localhost", "//thriftql.gigalixirapp.com"]],
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :livedemo,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_livedemo_key",
    signing_salt: "ovxL6G2W"

  plug LivedemoWeb.Router

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [check_origin: ["//localhost", "//thriftql.gigalixirapp.com"]],
    longpoll: false
end
