defmodule StringParameterize do
  @moduledoc false

  @doc  ~S"""
    This replaces all occurrences of non-alpha characters in a string with a separator.

    ## Examples
      iex> StringParameterize.parameterize("[]")
      ""
      iex> StringParameterize.parameterize("[1,2,3,4,5]")
      "1_2_3_4_5"
      iex> StringParameterize.parameterize("A string, with punctuation")
      "a_string_with_punctuation"
      iex> StringParameterize.parameterize("A string, with punctuation", separator: ";")
      "a;string;with;punctuation"
  """
  @spec parameterize(String.t(), Keyword.t() ) :: String.t()
  def parameterize(string, options \\[]) do
    separator = Keyword.get(options, :separator, "_")
    string
    |> String.downcase
    |> String.replace(~r/[^a-z0-9\-_]+/, separator)
    |> String.replace(~r/^#{separator}+/, "")
    |> String.replace(~r/#{separator}+$/, "")
  end

  @doc  ~S"""
    This replaces all occurrences of non-alpha characters in a file name but leaves the path alone.

    ## Examples
      iex> StringParameterize.parameterize_file_path("/tmp/1234APath/dave was here.Mp4")
      "/tmp/1234APath/dave_was_here.mp4"
  """
  @spec parameterize(String.t(), Keyword.t() ) :: String.t()
  def parameterize_file_path(file_path, options \\[]) do
    separator = Keyword.get(options, :separator, "_")
    extension = Path.extname(file_path)
    filename = Path.basename(file_path, extension)
    path = Path.dirname(file_path)
    filename = "#{StringParameterize.parameterize(filename, separator: separator)}#{extension}" |> String.downcase
    Path.join([path, filename])
  end
end
