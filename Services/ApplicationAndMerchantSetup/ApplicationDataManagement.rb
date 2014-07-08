require 'time'
require 'open-uri'

module Nab
class ApplicationManagement
    def self.save_application_data(nab_cws_client)
        defaults = {
      :ApplicationAttended => RbConfig::ApplicationAttended,
      :ApplicationLocation => RbConfig::ApplicationLocation,
      :ApplicationName => RbConfig::ApplicationName,
      :EncryptionType => RbConfig::EncryptionType,
      :HardwareType => Nab::HardwareType::PC,
      :PINCapability => RbConfig::PINCapability,
      :PTLSSocketId => RbConfig::PTLSSocketId,
      :ReadCapability => RbConfig::ReadCapability,
      :SerialNumber => 208093707,
      :SoftwareVersion => RbConfig::SoftwareVersion,
      :SoftwareVersionDate => RbConfig::SoftwareVersionDate
        }
    

        request = defaults #Nab.recursive_merge(defaults, request)

    nab_cws_client.last_call = self.name + "::" + __method__.to_s
        nab_cws_client.send(RbConfig::BasePath + '/SvcInfo/appprofile', request, Net::HTTP::Put, RbConfig::BaseURL)
    end

    def self.get_application_data(nab_cws_client, app_id)

    if app_id == ''
      app_id = nab_cws_client.application_profile_id
      return
    end
    app_id=URI::encode(app_id)
    nab_cws_client.last_call = self.class + self.method(app_id)

    nab_cws_client.last_call = self.name + "::" + __method__.to_s
        nab_cws_client.send('/svcinfo/appprofile/'+app_id, nil, Net::HTTP::Get)
    end

    def self.delete_application_data(nab_cws_client, app_id)

    if app_id == ''
      #false
      # We wont just default to deleting the main application profile.
      return
    end
    app_id=URI::encode(app_id)

    nab_cws_client.last_call = self.name + "::" + __method__.to_s
        nab_cws_client.send(RbConfig::BasePath + '/svcinfo/appprofile/'+app_id, nil, Net::HTTP::Delete, RbConfig::BaseURL)
    end

    def self.get_service_info(nab_cws_client)

    nab_cws_client.last_call = self.name + "::" + __method__.to_s
        nab_cws_client.send(RbConfig::BasePath + '/SvcInfo/serviceinformation', nil, Net::HTTP::Get, RbConfig::BaseURL)
    end
    
    
end
end

