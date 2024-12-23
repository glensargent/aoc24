defmodule Aoc24.MixProject do
  use Mix.Project

  def project do
    [
      app: :aoc24,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nimble_parsec, "~> 1.4"}
    ]
  end

  defp aliases do
    [
      day1: ["run -e 'Aoc24.Day1.run()'"],
      day2: ["run -e 'Aoc24.Day2.run()'"],
      day3: ["run -e 'Aoc24.Day3.run()'"]
    ]
  end
end
