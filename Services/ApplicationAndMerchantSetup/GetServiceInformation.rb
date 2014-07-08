require 'time'
require 'open-uri'

module Nab
class ServiceInformation

 def self.get_service_info(nab_cws_client)
        
    nab_cws_client.last_call = self.name + '::' + __method__.to_s;
      service_response = nab_cws_client.send("#{RbConfig::BasePath}/svcinfo/serviceinformation", nil, Net::HTTP::Get, RbConfig::BaseURL);
    
        end
      end
    end