defmodule Musikki.Editions do
	import Musikki.Helper, only: [build_query_params: 2]
	
	@moduledoc """
	Implements the Editions endpoint of the Musikki API.
	The Editions endpoints provide individual information about the 
	different versions of a release
	"Powered by Musikki" -- www.musikki.com
	"""

	@endpoint ~s(/editions)
	@host 							 Application.get_env(:musikki, :host)
	@appID 		{"AppID",  Application.get_env(:musikki, :appID)}
	@appKey		{"AppKey", Application.get_env(:musikki, :appKey)}

	@doc """
	Returns a summarized list of editions matching the query parameters.
	Filters:
		artist-name: 		 string, optional
		artist-mkid: 		 int, 	 optional
		release-mkid:    int, 	 optional
		edition-title: 	 string, optional
		edition-type:  	 string, optional, value: ["Album" or "EP" or "Single"]
		edition-subtype: string, optional, value: ["Studio" or " Live"]
		edition-format:  string, optional, value: ["CD" or "Vinyl" or "Digital"]
		barcode-type: 	 string, optional, value: ["UPC" or "EAN"]
		label-mkid: 		 int, 	 optional
		label-name:      string, optional
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
	Returns a complete profile for one specific edition.
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
	Returns the editions' song list.
	mkid: 					 int, 	 required
	Filters:
		artist-name: 	 string, optional
		artist-mkid: 	 int, 	 optional
		edition-mkid:  int, 	 optional
		edition-title: string, optional
		release-mkid:  int, 	 optional
		release-title: string, optional
		song-title: 	 string, optional
	"""
	def songs(mkid, filters \\ :empty) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/songs" <> build_query_params(filters, ""), 
			"", 
			[
				@appID, 
				@appKey
			])
	end	


end