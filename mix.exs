defmodule Facade.MixProject do
  use Mix.Project

  @source_url "https://github.com/devilcoders/facade"
  @version "0.1.0"

  def project do
    [
      app: :facade,
      description: "A set of simple Surface components based on Tailwindcss.",
      version: @version,
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      compilers: [:phoenix] ++ Mix.compilers(),
      deps: deps(),
      aliases: aliases(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def catalogues do
    [
      "priv/catalogue",
      "deps/surface/priv/catalogue"
    ]
  end

  defp elixirc_paths(:dev), do: ["lib"] ++ catalogues()
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:floki, "~> 0.30.0", only: :test},
      {:jason, "~> 1.0"},
      {:surface_catalogue, "~> 0.0.7", only: :dev},
      {:surface_formatter, "~> 0.3.1"},
      {:surface, "~> 0.3.2"},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:stream_data, "~> 0.4"},
      {:norm, "~> 0.12"}
    ]
  end

  defp aliases do
    [
      dev: "run --no-halt dev.exs"
    ]
  end

  defp package() do
    [
      files: ["lib", "mix.exs", "README*", "priv"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
