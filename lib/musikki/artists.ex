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
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/collaborations" <> build_query_params(filters, ""), 
			"", 
			[
				@appID, 
				@appKey
			])
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

	def releases(mkid) do
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/releases", 
			"", 
			[
				@appID, 
				@appKey
			])
	end	

	def releases(mkid, filters) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/releases" <> build_query_params(filters, ""), 
			"", 
			[
				@appID, 
				@appKey
			])
	end

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

def songs(mkid) do
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/songs", 
			"", 
			[
				@appID, 
				@appKey
			])
	end	

	def songs(mkid, filters) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/songs" <> build_query_params(filters, ""), 
			"", 
			[
				@appID, 
				@appKey
			])
	end

	def videos(mkid) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/videos", 
			"", 
			[
				@appID, 
				@appKey
			])		
	end

	def videos(mkid, filters) do 
		HTTPoison.request(
			:get, 
			@host <> @endpoint <> "/#{mkid}" <> "/videos" <> build_query_params(filters, ""), 
			"", 
			[
				@appID, 
				@appKey
			])		
	end	

	defp build_query_params([], param_list), do: "?q=" <> param_list
	defp build_query_params([{param, value} | tail], param_list) do 
		case tail do 
			[] -> build_query_params tail, param_list <> "[#{param}:#{value}]"

			_  -> build_query_params tail, param_list <> "[#{param}:#{value}],"
		end		
	end
 	
 end