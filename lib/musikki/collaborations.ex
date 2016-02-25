defmodule Musikki.Collaborations do
	import Musikki.Helper, only: [build_query_params: 2]

	@moduledoc """
	Implements the Collaborations endpoint of the Musikki API.
	The Collaborations endpoints provide information about work made 
	by collaboration between different artists.
	"""	

	@doc """
	Returns a summarized list of collaborations matching the query parameters.
	Filters:
		artist-mkid: 	 			int,  	optional
		artist-name: 	 			string, optional
		collaboration-name: string, optional
	"""
	@endpoint ~s(/collaborations)
	@host 							 Application.get_env(:musikki, :host)
	@appID 		{"AppID",  Application.get_env(:musikki, :appID)}
	@appKey		{"AppKey", Application.get_env(:musikki, :appKey)}	
	
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
	Returns a complete profile for one specific collaboration.
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
end