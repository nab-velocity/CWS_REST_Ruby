require 'time'
require 'open-uri'

module Nab
class MerchantManagement

    def self.get_merchant_profiles(nab_cws_client, workflow_id='')
    
    if workflow_id == ''
      workflow_id = nab_cws_client.workflow_id
    end
    if workflow_id != ''
      params='serviceId='+URI::encode(workflow_id)
    else
        params=''
    end
        
    nab_cws_client.last_call = self.name + '::' + __method__.to_s
        nab_cws_client.send("#{RbConfig::BasePath}/SvcInfo/merchProfile?#{params}", nil, Net::HTTP::Get, RbConfig::BaseURL)
    end
    
    def self.get_merchant_profile(nab_cws_client, merchant_profile_id='', workflow_id='')
    
    if workflow_id == ''
      workflow_id = nab_cws_client.workflow_id
    end
    if workflow_id != ''
      params='serviceId='+URI::encode(workflow_id)
    else
        params=''
    end
    
    if merchant_profile_id == ''
      merchant_profile_id = URI::encode(workflow_id)
    end
   # merchant_profile_id = URI::encode(merchant_profile_id)

    nab_cws_client.last_call = self.name + '::' + __method__.to_s
        nab_cws_client.send("#{RbConfig::BasePath}/SvcInfo/merchProfile/Merchant_#{merchant_profile_id}?#{params}", nil, Net::HTTP::Get, RbConfig::BaseURL)
    end
    
    
    
    def self.is_merchant_profile_initialized(nab_cws_client, merchant_profile_id = '', workflow_id='')
      
    if workflow_id == ''

      workflow_id = nab_cws_client.workflow_id
    end
    if workflow_id != ''
      params='serviceId='+URI::encode(workflow_id)
    else
        params=''
    end
    
    if merchant_profile_id == ''
      merchant_profile_id = nab_cws_client.merchant_profile_id
    end
    merchant_profile_id = URI::encode(merchant_profile_id)
    
    nab_cws_client.last_call = "#{self.name}::#{__method__.to_s}"
        result= nab_cws_client.send("#{RbConfig::BasePath}/svcinfo/merchProfile?#{merchant_profile_id}/#{params}", nil, Net::HTTP::Get, RbConfig::BaseURL)

        if result.data['RuleMessage'] == 'true'
            result.data['Success'] = true
        end
        result
    end
    
    def self.delete_merchant_profile(nab_cws_client, merchant_profile_id = '', workflow_id='')
    if workflow_id == ''
      workflow_id = nab_cws_client.workflow_id
    end
    if workflow_id != ''
      params='serviceId='+URI::encode(workflow_id)
    else
        params=''
    end
    if merchant_profile_id == ''
      #false
      return
    end
    
    merchant_profile_id = URI::encode(merchant_profile_id)

    nab_cws_client.last_call = self.name + '::' + __method__.to_s
        nab_cws_client.send("#{RbConfig::BasePath}/SvcInfo/merchProfile/#{merchant_profile_id}?#{params}", nil, Net::HTTP::Delete, RbConfig::BaseURL)
    end
    
    def self.save_merchant_profiles(nab_cws_client, merchant_profiles, workflow_id = '')
      
    if workflow_id == ''
      workflow_id = nab_cws_client.workflow_id
    end
    if workflow_id != ''
      params="serviceId=#{URI::encode(workflow_id)}"
    else
        params=''
    end
    merchant_profile_id = URI::encode(merchant_profile_id)

    nab_cws_client.last_call = self.name + '::' + __method__.to_s
        nab_cws_client.send("#{Config::BasePath}/SvcInfo/merchProfile?#{params}", merchant_profiles, Net::HTTP::Put, Config::BaseURL)
    end
    
    def self.save_merchant_profile(nab_cws_client, merchant_profile = '', workflow_id = '')
      defaults= {
      :ProfileId => "Merchant_#{workflow_id}", #'Unique Value Created by your application goes here',
      :WorkflowId => '', # aka ServiceId
      :MerchantData => {
        :CustomerServiceInternet => '',
        :CustomerServicePhone => '555 5550123',
        :Language => 'ENG',
        :Address => {
          :Street1 => '123 Main Street',
          :Street2 => '',
          :City => 'Denver',
          :StateProvince => 'CO',
          :PostalCode => '80202',
          :CountryCode => 'USA'
        },
        :MerchantId => '123456789012',
        :Name => 'TestMerchant', #Business name for merchant
        :Phone => '720 3773700',
        :TaxId => '',
        :BankcardMerchantData => {
          :IndustryType => RbConfig::IndustryType,
          :SIC => '5734',
          :TerminalId => '123'
          
        }
      },
      :TransactionData => {
        :BankcardTransactionDataDefaults => {
          :CurrencyCode => Nab::TypeISOCurrencyCodeA3::USD,
          :CustomerPresent => RbConfig::CustomerPresent,
          :EntryMode => RbConfig::EntryMode,
          :RequestACI => RbConfig::RequestACI,
          :RequestAdvice => Nab::RequestAdvice::Capable
        }
      }
    }
      
     if workflow_id == ''
       workflow_id = nab_cws_client.workflow_id
    end
    if workflow_id != ''
      params='serviceId='+URI::encode(workflow_id)
    else
        params=''
    end  
    
    defaults['WorkflowId'] = nab_cws_client.workflow_id


      merchant_profiles = [Nab.recursive_merge(defaults, merchant_profile)]
    
   p 'WorkflowId = ' + workflow_id
            
    nab_cws_client.last_call = self.name + '::' + __method__.to_s
        response = nab_cws_client.send("#{RbConfig::BasePath}/SvcInfo/merchProfile?#{params}", merchant_profiles, Net::HTTP::Put, RbConfig::BaseURL)
    end
  end
end