defmodule Musikki.Labels do
	import Musikki.Helper, only: [build_query_params: 2]

	@moduledoc """
	Implements the Labels endpoint of the Musikki API.
	The Labels endpoints provides information about labels, 
	associated artists and releases.
	"""

	@endpoint ~s(/labels)
	@host 							 Application.get_env(:musikki, :host)
	@appID 		{"AppID",  Application.get_env(:musikki, :appID)}
	@appKey		{"AppKey", Application.get_env(:musikki, :appKey)}

	@doc """
	Returns a summarized list of labels matching the query parameters.
	Filters:
		label-name: 	 string, optional
		artist-name: 	 string, optional
		release-mkid:  int, 	 optional
		release-title: string, optional
		edition-mkid:  int, 	 optional
		edition-title: string, optional
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
	Returns a complete profile for one specific label.
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
	Returns the list of artist in the label's roster.
	mkid: 					int, 	 	required
	Filters:
		artist-name:  string, optional
		artist-alias: string, optional
	"""
	def artists(mkid, filters \\ :empty) do
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/artists" <> build_query_params(filters, ""),
			"",
			[
				@appID,
				@appKey
			])
	end			

	@doc """
	Returns a list of editions released by the label.
	mkid: 						 int, 	 required
	Filters:
		artist-name: 		 string, optional
		artist-mkid: 		 int, 	 optional
		release-mkid: 	 int, 	 optional
		release-title: 	 string, optional
		edition-title: 	 string, optional
		edition-type: 	 string, optional, value: ["Album" or "EP" or "Single"]
		edition-subtype: string, optional, value: ["Studio" or "Live"]
		edition-format:  string, optional, value: ["CD" or "Vinyl" or "Digital"]
		barcode-type: 	 string, optional, value: ["UPC" or "EAN"]
	"""
	def editions(mkid, filters \\ :empty) do
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/editions" <> build_query_params(filters, ""),
			"",
			[
				@appID,
				@appKey
			])
	end			

end