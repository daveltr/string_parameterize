defmodule StringParameterize.Mixfile do
  use Mix.Project

  def project do
    [app: :string_parameterize,
     version: "0.1.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     package: package()
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:dialyxir, "~> 0.3", only: [:dev]}]
  end

  defp package do
  [
    files: ["lib", "mix.exs", "README", "LICENSE*"],
    maintainers: ["DT"],
    licenses: ["Apache 2.0"],
    links: %{"GitHub" => "https://github.com/daveltr/string_parameterize"}
  ]
end
end
