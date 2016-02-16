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

	def collaborations(mkid) do
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/collaborations", 
			"", 
			[
				@appID, 
				@appKey
			])
	end

	def collaborations(mkid, filters) do 
		collabs mkid, filters, ""
	end

	defp collabs(mkid, [], args_list) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/collaborations" 
						<> "?q=" <> args_list, 
			"", 
			[
				@appID, 
				@appKey
			])				
	end

	defp collabs(mkid, [{param, value} | tail], args_list) do 
		case tail do 
			[] -> collabs mkid, tail, args_list <> "[#{param}:#{value}]"

			_  -> collabs mkid, tail, args_list <> "[#{param}:#{value}],"
		end
	end

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

 	
 end