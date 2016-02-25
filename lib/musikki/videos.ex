defmodule Musikki.Videos do
	import Musikki.Helper, only: [build_query_params: 2]

	@moduledoc """
	Implements the Videos endpoint of the Musikki API.
	The Videos endpoints provide a wide range of video related information.
	"""

	@endpoint ~s(/videos)
	@host 							 Application.get_env(:musikki, :host)
	@appID 		{"AppID",  Application.get_env(:musikki, :appID)}
	@appKey		{"AppKey", Application.get_env(:musikki, :appKey)}

	@doc """
	Returns a summarized list of videos matching the query parameters.
	Filters:
		service-name: string, optional, value: ["youtube"]
		artist-mkid: 	int, 		optional
		release-mkid: int, 		optional
		track-mkid: 	int, 	  optional
		country-code: string, optional
		video-id: 		string, optional
	"""
	def search(filters) do
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> build_query_params(filters, ""),
			"",
			[
				@appID,
				@appKey
			])
	end					
end