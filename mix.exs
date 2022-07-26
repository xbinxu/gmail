defmodule Gmail.Mixfile do
  use Mix.Project

  def project do
    [
      app: :gmail,
      version: "0.1.20",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.post": :test],
      description: "A simple Gmail REST API client for Elixir",
      package: package()
    ]
  end

  def application do
    [extra_applications: [:logger], mod: {Gmail, []}]
  end

  defp deps do
    [
      {:poolboy, "~> 1.5"},
      {:httpoison, "~> 1.8"},
      {:poison, "~> 5.0", override: true},
      {:mock, "~> 0.3", only: :test},
      {:excoveralls, "~> 0.14", only: :test},
      {:earmark, "~> 1.4", only: :dev},
      {:earmark_parser, "~> 1.4", only: :dev, override: true},
      {:ex_doc, "~> 0.28", only: :dev},
      {:dialyxir, "~> 1.2", only: :dev},
      {:credo, "~> 1.6", only: :dev, override: true},
      {:bypass, "~> 2.1", only: :test},
      {:inch_ex, "~> 0.5", only: :docs},
      {:mix_test_watch, "~> 1.1", only: :dev}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      maintainers: ["Craig Paterson"],
      links: %{"Github" => "https://github.com/craigp/elixir-gmail"}
    ]
  end
end
