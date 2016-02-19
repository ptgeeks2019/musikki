defmodule ArtistsTest do
  use ExUnit.Case
  doctest Musikki
  alias Musikki.Artists, as: Ar

  test "artist search gives correct MKID, name and country" do
    {:ok, response} = Ar.search [{"artist-name", "Porcupine+Tree"}]
    destruct			  = Map.from_struct response
    decoded				  = destruct[:body] |> Poison.decode! |> Map.get("results") |> List.first

    assert decoded["mkid"] == 100020143
    assert decoded["name"] == "Porcupine Tree"
    assert decoded["location"]["current"]["country"]["name"] == "United Kingdom"
  end
end
