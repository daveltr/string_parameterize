defmodule StringParameterizeTest do
  use ExUnit.Case
  doctest StringParameterize

  test "parameterizes a string" do
      string = "A string with chars to replace!"
      assert StringParameterize.parameterize(string) == "a_string_with_chars_to_replace"
  end

  test "parameterizes a string with separator" do
      string = "A string with chars to replace!"
      assert StringParameterize.parameterize(string, separator: ";") == "a;string;with;chars;to;replace"
  end

  test "parameterize_file_path" do
    path = "/tmp/abc/123/testFileName 1234-adkfajdl .mp4"
    assert StringParameterize.parameterize_file_path(path) == "/tmp/abc/123/testfilename_1234-adkfajdl.mp4"
  end

  test "parameterize_file_path with separator" do
    path = "/tmp/abc/123/testFileName 1234-adkfajdl--.mp4"
    assert StringParameterize.parameterize_file_path(path, separator: ";") == "/tmp/abc/123/testfilename;1234-adkfajdl--.mp4"
  end

  test "parameterize_file_path with only a filename" do
    path = "testFileName 1234-adkfajdl.mp4"
    assert StringParameterize.parameterize_file_path(path) == "./testfilename_1234-adkfajdl.mp4"
  end
end
