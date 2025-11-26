defmodule ExHailo.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_hailo,
      version: "0.1.0",
      elixir: "~> 1.18",
      compilers: [:elixir_make] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      make_clean: ["clean"],
      make_env: fn ->
        %{
          "FINE_INCLUDE_DIR" => Fine.include_dir()
        }
      end
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
      {:elixir_make, "~> 0.9", runtime: false},
      {:fine, "~> 0.1.0", runtime: false}
    ]
  end
end
