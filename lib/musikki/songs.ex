defmodule Musikki.Songs do
	import Musikki.Helper, only: [build_query_params: 2]

	@moduledoc """
	Implements the Songs endpoint of the Musikki API.
	The Songs endpoints provide a wide range of song related information.
	"""

	@endpoint ~s(/songs)
	@host 							 Application.get_env(:musikki, :host)
	@appID 		{"AppID",  Application.get_env(:musikki, :appID)}
	@appKey		{"AppKey", Application.get_env(:musikki, :appKey)}

	@doc """
	Returns a summarized list of songs matching the query parameters.
	Filters:
		artist-name: 		 string, optional
		artist-mkid: 		 int, 	 optional
		edition-mkid: 	 int, 	 optional
		edition-title:   string, optional
		query-type: 		 sting,  optional, value: ["suggest" or "full"]
		release-mkid: 	 int, 	 optional
		release-title: 	 string, optional
		song-title: 		 string, optional
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

	@doc """
	Returns a complete profile for one specific song.
	mkid: int, required
	"""
	def info(mkid) do
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}",
			"",
			[
				@appID,
				@appKey
			])
	end			

	@doc """
	Returns a list of releases where the song is featured.
	mkid: int, required
	"""
	def featuredIn(mkid) do
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "featuredin",
			"",
			[
				@appID,
				@appKey
			])
	end				

	@doc """
	Returns a list of external streaming services for the song.
	mkid: int, required
	"""
	def listen(mkid) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/listen",
			"",
			[
				@appID,
				@appKey
			])		
	end	
	
end