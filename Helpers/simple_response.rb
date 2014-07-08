module Nab
	class SimpleResponse
	
		attr :data, :body, :code, :response
	
		def initialize(response)
			@code= response.code
			@body= response.body
			@response= response
			
			if (response.body[0] == "{")
				@data= JSON.parse(response.body);
				@data["Success"] = true;
			elsif (response.body[0] == "[")
				@data= JSON.parse(response.body);
				@data = {"Results"=> @data, "Success" => true};
			elsif (response.body[0] == "<")
				p "XML Was returned."
				rule_message= response.body
				
				element_name = "RuleMessage";
				
				found = /<#{element_name}(?:\s+[^>]+)?>(.*?)<\/#{element_name}>/.match(@body);
				if !found.nil? then
					rule_message= found[1];  #ignore the enclosing tags
				else
					
					# Next best thing, seen in the txn endpoints
					element_name = "a:string";
					found = /<#{element_name}(?:\s+[^>]+)?>(.*?)<\/#{element_name}>/.match(@body);
					
					if !found.nil? then
						rule_message= found[1];  #ignore the enclosing tags
					end
				end
			
				@data= {"Success" => false, "RuleMessage" => rule_message}
			else
				@data = {"Success"=>false, "RuleMessage" => @body}
			end
		end	
	end
end
