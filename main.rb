# Copyright (c) 2014 North American Bancard, LLC - All Rights Reserved.
 #
 # This software and documentation is subject to and made
 # available only pursuant to the terms of an executed license
 # agreement, and may be used only in accordance with the terms
 # of said agreement. This software may not, in whole or in part,
 # be copied, photocopied, reproduced, translated, or reduced to
 # any electronic medium or machine-readable form without
 # prior consent, in writing, from North American Bancard.
 #
 # Use, duplication or disclosure by the U.S. Government is subject
 # to restrictions set forth in an executed license agreement
 # and in subparagraph (c)(1) of the Commercial Computer
 # Software-Restricted Rights Clause at FAR 52.227-19; subparagraph
 # (c)(1)(ii) of the Rights in Technical Data and Computer Software
 # clause at DFARS 252.227-7013, subparagraph (d) of the Commercial
 # Computer Software--Licensing clause at NASA FAR supplement
 # 16-52.227-86; or their equivalent.
 #
 # Information in this software is subject to change without notice
 # and does not represent a commitment on the part of North American Bancard.
 #
 # Sample Code is for reference Only and is intended to be used for educational purposes. It"s the responsibility of
 # the software company to properly integrate into their solution code that best meets their production needs.
 #
require_relative 'client_api'
require_relative 'config'
require_relative 'Helpers/simple_response'
require_relative 'Helpers/constants'
require_relative 'Helpers/recursive_merge'
require 'json'

#Used to log request to file if stdout is insufficient.
#def p (string)
#fp= File.open('.\log.txt','a+')
#	fp.write(string.to_s+"\n")
#	fp.close()
#end

p "Hello! Before you test this sample code, please crack open the code and check out what's going on."
p "Your solutions consultant has selected a number of tests to run through to ensure this sample works."
p "If you have questions, please contact us at support@nabvelocity.com"

# Publisher

client=NabCWSClient.new

########################################################
#                                                      #
#   Once your application has been Configured you      #
#   should always retrieve the values from your        #
#   database where these have been persisted.  The     #
#   values in the config file are there for demo       #
#   purposes only.                                     #
#                                                      #
########################################################

 if RbConfig::ActivationKey != '' && RbConfig::MerchantType == 'Managed'
  client.service_id = '39C6700001'
  client.merchant_profile_id = RbConfig::ActivationKey
 elsif RbConfig::ActivationKey != '' && MerchantType == 'Unmanaged'
  client.service_id = '4C85600001'
  client.merchant_profile_id = RbConfig::ActivationKey+'_TC'
 else
  client.merchant_profile_id = RbConfig::MerchantProfileId
  client.service_id = RbConfig::ServiceID
 end



client.merchant_profile_id= RbConfig::MerchantProfileId
client.application_profile_id=RbConfig::ApplicationProfileId
client.workflow_id= RbConfig::WorkflowId
client.service_id = RbConfig::ServiceID

client.sign_on(RbConfig::IdentityToken)

if !RbConfig::UseWorkflow
  client.workflow_id = RbConfig::ServiceID
end

module Workflows
	def self.test_assert(test, result)
    unless test
      p "FAILED: #{result.last_call}"
      exit()
    else
      p "SUCCESS: #{result.last_call}"
    end
	end
end

if client.application_profile_id == ''
    p 'Calling SaveApplicationData'

    appProfileId = Nab::ApplicationManagement::save_application_data(client)
    parsed_response = JSON.parse(appProfileId.body)
    client.application_profile_id = parsed_response['id']
    p 'ApplicationProfileId = ' + client.application_profile_id
    
    end      

if client.workflow_id == ''
  p 'Calling GetServiceInformation'
  service_response = Nab::ServiceInformation::get_service_info(client)
  if service_response.data['BankcardServices'].length != 0
    service_response.data['BankcardServices'].each { |service|

      next if service['Operations'].nil?

      client.workflow_id = service['ServiceId']
    }
  end
   end

if client.merchant_profile_id == ''
    p 'Calling SaveMerchantProfiles'

    Nab::MerchantManagement::save_merchant_profile(client, {}, client.service_id)
end

if client.merchant_profile_id != nil && client.service_id != nil
  p 'Calling GetMerchantProfile'
  Nab::MerchantManagement::get_merchant_profile(client, client.merchant_profile_id, client.workflow_id)

end
p 'Ready for Host Capture  Script'

Workflows::HostCapture(client)

p 'Ready for Terminal Capture Script'

Workflows::TerminalCapture(client)

p 'Ready for TMS Script'

Workflows::TMS(client)

p 'Done.'