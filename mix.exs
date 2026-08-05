defmodule BambooSmtp.Mixfile do
  use Mix.Project

  @project_url "https://github.com/fewlinesco/bamboo_smtp"
  @version "4.2.2"

  def project do
    [
      app: :bamboo_smtp,
      version: @version,
      source_url: @project_url,
      homepage_url: @project_url,
      name: "Bamboo SMTP Adapter",
      description: "A Bamboo adapter for SMTP",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [applications: [:gen_smtp, :logger, :bamboo]]
  end

  defp deps do
    [
      # core
      {:bamboo, "~> 2.3.1"},
      {:gen_smtp, "~> 1.2.0"},

      # doc
      {:earmark, ">= 1.3.2", only: :docs},
      {:inch_ex, "~> 2.0.0", only: :docs},

      # dev & test
      {:credo, "~> 1.7.8", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.40.0 and < 2.0.0", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.14.0", only: :test}
    ]
  end

  defp package do
    [
      maintainers: ["Kevin Disneur", "Thomas Gautier"],
      licenses: ["MIT"],
      links: %{
        "Changelog" => "#{@project_url}/blob/main/CHANGELOG.md",
        "GitHub" => @project_url
      }
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      extras: ["README.md", "CHANGELOG.md": [title: "Changelog"]]
    ]
  end
end
