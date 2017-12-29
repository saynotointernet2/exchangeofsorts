defmodule EOS.Mixfile do
  use Mix.Project

  def project do
    [
      app: :EOS,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      applications: [:plug, :cowboy],
      mod: {EOS, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.5.0-rc.0"},
      {:cowboy, "~> 2.2.0"},
      {:poison, "~> 3.1.0"}
    ]
  end
end
