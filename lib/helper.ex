defmodule Musikki.Helper do

	def build_query_params(:empty, _), do: ""
	def build_query_params([], param_list), do: "?q=" <> param_list
	def build_query_params([{param, value} | tail], param_list) do 
		case tail do 
			[] -> build_query_params tail, param_list <> "[#{param}:#{value}]"

			_  -> build_query_params tail, param_list <> "[#{param}:#{value}],"
		end		
	end		
end