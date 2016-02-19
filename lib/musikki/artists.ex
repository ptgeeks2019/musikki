defmodule Musikki.Artists do
	import Musikki.Helper, only: [build_query_params: 2]

	@endpoint ~s(/artists)
	@host 							 Application.get_env(:musikki, :host)
	@appID 		{"AppID",  Application.get_env(:musikki, :appID)}
	@appKey		{"AppKey", Application.get_env(:musikki, :appKey)}


	@doc """
	Returns a summarized list of artists matching the query parameters.
	Filters:
		artist-name:  string, optional
		artist-alias: string, optional
		label-name:   string, optional
		label-mkid:   int, 	  optional
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
	Returns a complete profile for one specific artist.
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
	Returns a list of alternative biographies from multiple sources.
	mkid: int, required
	"""
	def bio(mkid) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/bio", 
			"", 
			[
				@appID, 
				@appKey
			])  		
	end

	@doc """
	Returns a list of artists who have collaborated with the artist.
	mkid: 								int, 	  required
	Filters:
		artist-name: 				string, optional
		label-name:  				string, optional
		collaboration-name: string, optional
	"""
	def collaborations(mkid, filters \\ :empty) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/collaborations" <> build_query_params(filters, ""), 
			"", 
			[
				@appID, 
				@appKey
			])
	end

	@doc """
	Returns a list of labels related to the artist.
	mkid: 					 int,    required
	Filters:
		label-name:    string, optional
		artist-name:   string, optional
		release-mkid:  int,    optional
		release-title: string, optional
		edition-mkid:  int, 	 optional
		edition-title: string, optional
	"""
	def labels(mkid) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/labels", 
			"", 
			[
				@appID, 
				@appKey
			])		
	end

	@doc """
	Returns a list of external streaming services for the artist.
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
	Returns articles, from various media, related to the artist.
	mkid: int, required	
	"""
	def news(mkid) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/news", 
			"", 
			[
				@appID, 
				@appKey
			])				
	end	

	@doc """
	Returns a list of related artists.
	mkid: 					 int,    required
	type:
		relation-type: string, required, value: ["sound" or "label"]
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
	Returns the artist's complete discography.
	mkid: 					 	 int, 	 required
	filters:
		artist-name: 		 string, optional
		artist-mkid: 	   int, 	 optional
		release-title: 	 string, optional
		release-type: 	 string, optional, value: ["Album" or "EP" or "Single"]
		release-format:  string, optional, value: ["CD" or "Vinyl" or "Digital"]
		release-barcode: string, optional
	"""
	def releases(mkid, filters \\ :empty) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/releases" <> build_query_params(filters, ""), 
			"", 
			[
				@appID, 
				@appKey
			])
	end

	@doc """
	Returns a release count summary, grouped by release types.
	mkid: int, required
	"""
	def release_summary(mkid) do
	 	HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/releases/summary", 
			"", 
			[
				@appID, 
				@appKey
			])
	end

	@doc """
	Returns the artist's social account streams.
	mkid: 	 int,    required
	service: string, required, value: ["facebook" or "twitter"]
	"""
	def social(mkid, service) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/social?q=[service-name:#{service}]", 
			"", 
			[
				@appID, 
				@appKey
			])			
	end	

	@doc """
	Returns the artist's complete song list.
	mkid: 				 int, 	 required
	filters: 
	artist-name:   string, optional
	artist-mkid:   int, 	 optional
	edition-mkid:  int, 	 optional
	edition-title: string, optional
	query-type: 	 string, optional, value: ["suggest" or "full"]
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

	@doc """
	Returns videos related to the artist.
	mkid: 					int, 		required
	filters:
		service-name: string, optional, value: ["youtube"]
		artist-mkid:  int, 		optional
		release-mkid: int, 		optional
		track-mkid: 	int, 		optional
		video-id: 		int, 		optional
	"""
	def videos(mkid, filters \\ :empty) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/videos" <> build_query_params(filters, ""), 
			"", 
			[
				@appID, 
				@appKey
			])		
	end	
end