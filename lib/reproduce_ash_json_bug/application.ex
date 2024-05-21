defmodule ReproduceAshJsonBug.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ReproduceAshJsonBugWeb.Telemetry,
      ReproduceAshJsonBug.Repo,
      {DNSCluster, query: Application.get_env(:reproduce_ash_json_bug, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ReproduceAshJsonBug.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ReproduceAshJsonBug.Finch},
      # Start a worker by calling: ReproduceAshJsonBug.Worker.start_link(arg)
      # {ReproduceAshJsonBug.Worker, arg},
      # Start to serve requests, typically the last entry
      ReproduceAshJsonBugWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ReproduceAshJsonBug.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ReproduceAshJsonBugWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
