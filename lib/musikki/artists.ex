defmodule Musikki.Artists do

	@endpoint ~s(/artists)
	@host 		~s(https://music-api.musikki.com/v1)
	@appID 		{"AppID",  Application.get_env(:musikki, :appID)}
	@appKey		{"AppKey", Application.get_env(:musikki, :appKey)}

	def search(artist_name, filters \\ :empty) do
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "?q=#{artist_name}",
			"",
			[
				@appID,
				@appKey
			])
		
	end

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