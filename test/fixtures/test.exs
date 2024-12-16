defmodule Test.MixProject do
  use Mix.Project

  def deps() do
    [
      {:phoenix, "~> 1.7.18"},
      {:plug, ">= 0.4.0"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:gettext, git: "https://github.com/elixir-lang/gettext.git", tag: "0.1"},
      {:local_dependency, path: "path/to/local_dependency"}
    ]
  end
end
