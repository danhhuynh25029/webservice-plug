defmodule Serivce.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Serivce.Router, options: [port: 8081]},
      {
        Mongo,
        [
          name: :mongo,
          database: "soc",
          pool_size: 10
        ]
      }
      # Starts a worker by calling: Serivce.Worker.start_link(arg)
      # {Serivce.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Serivce.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
