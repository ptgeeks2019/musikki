defmodule Musikki.Releases do
	import Musikki.Helper, only: [build_query_params: 2]


	@endpoint ~s(/releases)
	@host 							 Application.get_env(:musikki, :host)
	@appID 		{"AppID",  Application.get_env(:musikki, :appID)}
	@appKey		{"AppKey", Application.get_env(:musikki, :appKey)}


	@doc """
	Returns a summarized list of releases matching the query parameters.
	Filters:
		artist-name: 		 string, optional
		artist-mkid: 		 int, 	 optional
		release-title: 	 string, optional
		release-type:  	 string, optional, value: ["Album" or "EP" or "Single"]
		release-subtype: string, optional, value: ["Studio" or " Live"]
		release-format:  string, optional, value: ["CD" or "Vinyl" or "Digital"]
		release-barcode: string, optional
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
	Returns a list of the releases' different editions.
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
		edition-barcode: string, optional
		barcode-type: 	 string, optional, value: ["UPC" or "EAN"]
		label-mkid: 		 int, 	 optional
		label-name: 		 string, optional

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

	@doc """
	Returns a complete profile for one specific release.
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
	Returns a list of external streaming services for the release.
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

	@doc """
	Returns a summarized list of releases, by multiple artists, 
	related to the release.
	mkid: int, 	  required
	type: string, optional, value: ["artist" or "purchase" or "label"]
	"""
	def related(mkid, type) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/related?q=[relation-type:#{type}]", 
			"", 
			[
				@appID, 
				@appKey
			])			
	end

	@doc """
	Returns review articles, from various media, related to the release.
	mkid: int, required
	"""
	def reviews(mkid) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/reviews",
			"",
			[
				@appID,
				@appKey
			])		
	end	

	@doc """
	Returns the releases' song list.
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