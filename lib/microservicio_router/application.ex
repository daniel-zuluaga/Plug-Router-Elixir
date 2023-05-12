defmodule MicroservicioRouter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias Plug.Cowboy
  # alias MicroservicioRouter.PlugConn
  alias MicroservicioRouter.PlugRouter

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: MicroservicioRouter.Worker.start_link(arg)
      # {MicroservicioRouter.Worker, arg}
      # Cowboy.child_spec(plug: PlugConn, scheme: :http)
      Cowboy.child_spec(plug: PlugRouter, scheme: :http)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MicroservicioRouter.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
