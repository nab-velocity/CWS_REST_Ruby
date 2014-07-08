require 'time'

module Nab
class Txn
	def self.authorize_encrypted(nab_cws_client, request)
		defaults= {
			'$type' => 'AuthorizeTransaction,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Rest',
			:ApplicationProfileId => 'XXXX',
			:MerchantProfileId => 'XXXX',
			:Transaction => {
				'$type' => 'BankcardTransaction,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Bankcard',
				
				:TenderData => {
					:SecurePaymentAccountData => '87936F09AE06386BA4CD81ADFF7DF0FA5AC1B28EF9F7B7075E415545F9B9095C0AC5FA12B9905325', #Encrypted Track 2 data returned by MagneSafe device when card is swiped.
					:CardSecurityData => {
						 :IdentificationInformation => '9ED72A486AB36DC352957C2C00607E937D1D90CB8B09A8588629AABA8EAF0FD65296A4FBA490EECFCD8D5B350438C4BFA6A36FFA2ADAAA3E', # Encrypted MagnePrint� Information returned by the MagneSafe� device when card is swiped.
						},
						:EncryptionKeyId => '9010010B0C2472000021',  # 20-character string returned by MagneSafe device when card is swiped.
						:SwipeStatus => '00304061', # MagnePrint Status of Card Swipe. This is an alpha numeric string, returned by MagneSafe device when card is swiped.
						:DeviceSerialNumber => 'B0C2472071812AA'

				},
        :MerchantData => {
            :CntryCode => 'USA'

        },
				:TransactionData => {
					:Amount => '10.00',
					:CurrencyCode => Nab::TypeISOCurrencyCodeA3::USD,
					:TransactionDateTime => '2012-03-22T14:57:28-06:00',
					:ApprovalCode => nil, # Only set this for Force Post Voice Authorized transactions.
					:CashBackAmount => '0.00', # Used only for PINDebit transactions
					:CustomerPresent => RbConfig::TxnData_CustomerPresent,
					:EmployeeId => '1234',
					:EntryMode => RbConfig::TxnData_EntryMode,
					:OrderNumber => '12345',
					:Reference => '11', # This needs to be a unique value for each transaction
					:SignatureCaptured => true, # set to true if signature is captured physically or digitally
					:TipAmount => '0.00'
				}
			}
		}

		defaults['MerchantProfileId'] = nab_cws_client.merchant_profile_id
		defaults['ApplicationProfileId'] = nab_cws_client.application_profile_id

		request = Nab.recursive_merge(defaults, request)

		workflow_id = URI::encode(nab_cws_client.workflow_id)

		nab_cws_client.last_call = self.name + '::' + __method__.to_s
		nab_cws_client.send( Config::BasePath + '/txn/'+ workflow_id, request, Net::HTTP::Post, Config::BaseURL)
	end

	def self.authorize(nab_cws_client, request)
		defaults= {
			'$type' => 'AuthorizeTransaction,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Rest',
			:Transaction => {
				'$type' => 'BankcardTransaction,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Bankcard',
        :MerchantData => {
          :CntryCode => "USA",
            :MerchId   => '12345',
            :MerchName => 'DudeCorp',
            :LangInd   => 'ENG',
            :MerchAddress => {
                :Street1 => '123 Dude St',
                :City => 'Arcata',
                :PostalCode => '95521',
                :CntryCode => 'USA'
            },
            :MerchId => '4445000868851',
            :MerchName => 'Little Ship'
        },
				:TenderData => {
          :PaymentAccountDataToken => nil,  # Used in place of Card Data
          :SecurePaymentAccountData => nil,
          :CardData => {
            :CardType => Nab::TypeCardType::Visa,
            :CardholderName => nil,
            :PAN => '4111111111111111',
            :Expire => '1015',
            :Track1Data => nil,
            :Track2Data => '4012000033330026=09041011000012345678'
          }#,
          # AVS Data is optional.  For Keyed transactions the Postal Code will help qualify your transaction for lower interchange
          #'CardSecurityData' => {
            #'AVSData' => {
              #'CardholderName' => 'SJohnson',
              #'Street' => '777 Cherry Street',
              #'City' => 'Denver',
              #'StateProvince' => 'CO',
              #'PostalCode' => '80220',
              #'Country' => Nab::ISOCountryCodeA3::USA,
              #'Phone' => nil
            #},
             # CVData is optional
            #'CVDataProvided' => Nab::CVDataProvided::Provided,
            #'CVData' => '123',
            #'KeySerialNumber' => nil,
            #'PIN' => nil
          #}
        },
				:TransactionData => {
					:Amount => '10.00',
					:CurrencyCode => Nab::TypeISOCurrencyCodeA3::USD,
					:TransactionDateTime => '2013-04-03T13:50:16',
					#'AccountType' => Nab::AccountType::NotSet, # Used only for PINDebit transactions
					:ApprovalCode => nil, # Only set this for Force Post Voice Authorized transactions.
          :IndustryType => 'Retail', # Required for Authorize Txn
					#'CashBackAmount' => '0.00', # Used only for PINDebit transactions
					:CustomerPresent => RbConfig::TxnData_CustomerPresent,
					:EmployeeId => '1234',
					:EntryMode => RbConfig::TxnData_EntryMode,
					# 'GoodsType' => Nab::GoodsType::DigitalGoods, # Used only for Ecommerce IndustryType transactions
					#'InternetTransactionData' => {
						#'IpAddress' => '1.1.1.1',
						#'SessionId' => '12345'
					#},
					#'InvoiceNumber' => nil,
					:OrderNumber => '12345',
					#'IsPartialShipment' => false, # Used in Ecommerce/MOTO
					:SignatureCaptured => true, # set to true if signature is captured physically or digitally
					:TipAmount => '0.00',
          :TransactionCode => Nab::TransactionCode::NotSet  # Only use the Override flag if you wish to force a duplicate authorization through for the same card - same amount
				}
			}
		}

		defaults['ApplicationProfileId'] = nab_cws_client.application_profile_id
		defaults['MerchantProfileId'] = nab_cws_client.merchant_profile_id

		request = Nab.recursive_merge(defaults, request)

		workflow_id = URI::encode(nab_cws_client.workflow_id)
		
		nab_cws_client.last_call = self.name + '::' + __method__.to_s
		nab_cws_client.send( "#{RbConfig::BasePath}/txn/#{workflow_id}", request, Net::HTTP::Post, RbConfig::BaseURL)
	end
def self.authorize_and_capture_encrypted(nab_cws_client, request)
    defaults= {
      '$type' => 'AuthorizeTransaction,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Rest',
      :ApplicationProfileId => 'XXXX',
      :MerchantProfileId => 'XXXX',
      :Transaction => {
        '$type' => 'BankcardTransaction,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Bankcard',
        
        :TenderData => {
          :SecurePaymentAccountData => '87936F09AE06386BA4CD81ADFF7DF0FA5AC1B28EF9F7B7075E415545F9B9095C0AC5FA12B9905325', #Encrypted Track 2 data returned by MagneSafe device when card is swiped.
          :CardSecurityData => {
             :IdentificationInformation => '9ED72A486AB36DC352957C2C00607E937D1D90CB8B09A8588629AABA8EAF0FD65296A4FBA490EECFCD8D5B350438C4BFA6A36FFA2ADAAA3E', # Encrypted MagnePrint� Information returned by the MagneSafe� device when card is swiped.
            },
            :EncryptionKeyId => '9010010B0C2472000021',  # 20-character string returned by MagneSafe device when card is swiped.
            :SwipeStatus => '00304061', # MagnePrint Status of Card Swipe. This is an alpha numeric string, returned by MagneSafe device when card is swiped.
            :DeviceSerialNumber => 'B0C2472071812AA'

        },
        :TransactionData => {
          :Amount => '10.00',
          :CurrencyCode => Nab::TypeISOCurrencyCodeA3::USD,
          :TransactionDateTime => '2012-03-22T14:57:28-06:00',
          :ApprovalCode => nil, # Only set this for Force Post Voice Authorized transactions.
          :CashBackAmount => '0.00', # Used only for PINDebit transactions
          :CustomerPresent => RbConfig::TxnData_CustomerPresent,
          :EmployeeId => '1234',
          :IndustryType => 'Retail',
          :EntryMode => RbConfig::TxnData_EntryMode,
          :OrderNumber => '12345',
          :Reference => '11', # This needs to be a unique value for each transaction
          :SignatureCaptured => true, # set to true if signature is captured physically or digitally
          :TipAmount => '0.00'
        }
      }
    }

    defaults['MerchantProfileId'] = nab_cws_client.merchant_profile_id
    defaults['ApplicationProfileId'] = nab_cws_client.application_profile_id

    request = Nab.recursive_merge(defaults, request)

    workflow_id = URI::encode(nab_cws_client.workflow_id)

    nab_cws_client.last_call = self.name + '::' + __method__.to_s
    nab_cws_client.send("#{RbConfig::BasePath}/txn/#{workflow_id}", request, Net::HTTP::Post, RbConfig::BaseURL)
  end
  
def self.authorize_and_capture(nab_cws_client, request)
    defaults= {
      '$type' => 'AuthorizeAndCaptureTransaction,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Rest',
      :ApplicationProfileId => '',
         :MerchantProfileId => '',
               :Transaction => {
                         '$type' => 'BankcardTransaction,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Bankcard',
                     :TenderData => {
                     :PaymentAccountDataToken => nil,  # Used in place of Card Data
                     :SecurePaymentAccountData => nil,
                         :CardData => {
                             :CardType => Nab::TypeCardType::Visa,
                             :CardholderName => nil,
                             :PAN => '4111111111111111',
                             :Expire => '1015',
                             :Track1Data => nil,
                             :Track2Data => '4012000033330026=09041011000012345678'
                     },
      #,
      # AVS Data is optional.  For Keyed transactions the Postal Code will help qualify your transaction for lower interchange
      #'CardSecurityData' => {
      #'AVSData' => {
      #'CardholderName' => 'SJohnson',
      #'Street' => '777 Cherry Street',
      #'City' => 'Denver',
      #'StateProvince' => 'CO',
      #'PostalCode' => '80220',
      #'Country' => Nab::ISOCountryCodeA3::USA,
      #'Phone' => nil
      #},
      # CVData is optional
      #'CVDataProvided' => Nab::CVDataProvided::Provided,
      #'CVData' => '123',
      #'KeySerialNumber' => nil,
      #'PIN' => nil
      #}


        },
                     :TransactionData => {
                         :Amount => '10.00',
                         :CurrencyCode => Nab::TypeISOCurrencyCodeA3::USD,
                         :TransactionDateTime => '2012-03-22T14:57:28-06:00',
                         :AccountType => Nab::AccountType::NotSet, # Used only for PINDebit transactions
                         :ApprovalCode => nil, # Only set this for Force Post Voice Authorized transactions.
                         :CashBackAmount => '0.00', # Used only for PINDebit transactions
                         :CustomerPresent => RbConfig::TxnData_CustomerPresent,
                         :EmployeeId => '1234',
                         :EntryMode => RbConfig::TxnData_EntryMode,
                         # 'GoodsType' => Nab::GoodsType::DigitalGoods, # Used only for Ecommerce IndustryType transactions
                         #'InternetTransactionData' => {
                         #'IpAddress' => '1.1.1.1',
                         #'SessionId' => '12345'
                         #},
                         #'InvoiceNumber' => nil,
                         :OrderNumber => '12345',
                         #'IsPartialShipment' => false, # Used in Ecommerce/MOTO
                         :SignatureCaptured => true, # set to true if signature is captured physically or digitally
                         :TipAmount => '0.00',
                         :TransactionCode => Nab::TransactionCode::NotSet  # Only use the Override flag if you wish to force a duplicate authorization through for the same card - same amount
                     }
      }
    }
    defaults['ApplicationProfileId'] = nab_cws_client.application_profile_id


    defaults['MerchantProfileId'] = nab_cws_client.merchant_profile_id

    request = Nab.recursive_merge(defaults, request)

    workflow_id = URI::encode(nab_cws_client.workflow_id)
    
    nab_cws_client.last_call = self.name + '::' + __method__.to_s
    nab_cws_client.send( "#{RbConfig::BasePath}/txn/#{workflow_id}", request, Net::HTTP::Post, RbConfig::BaseURL)
  end


	def self.capture(nab_cws_client, request)
		defaults={
			 '$type' => 'CaptureTransaction,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Rest',
			 :ApplicationProfileId => '' ,
			 :DifferenceData => {
				 '$type' => 'BankcardCapture,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Bankcard',
				 :Amount => '10.00',
				 :TransactionId => '',
				 :TipAmount => '0.00',
				 :Addendum => ''
			 }
		 }

		defaults['ApplicationProfileId'] = nab_cws_client.application_profile_id
    defaults['MerchantProfileId'] = nab_cws_client.merchant_profile_id
		request = Nab.recursive_merge(defaults, request)

		workflow_id = URI::encode(nab_cws_client.workflow_id)
		
		nab_cws_client.last_call = self.name + '::' + __method__.to_s
		nab_cws_client.send("#{RbConfig::BasePath}/txn/#{workflow_id}/#{request["DifferenceData"]["TransactionId"]}", request, Net::HTTP::Put, RbConfig::BaseURL)
	end

	def self.undo(nab_cws_client, request)
		defaults={
			'$type' => 'Undo,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Rest',
			:ApplicationProfileId => '',
			:DifferenceData => {
				'$type' => 'BankcardUndo,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Bankcard',
				:TransactionId => '--Transaction ID Required--',
				:Addendum => nil
			}
		}

		defaults['ApplicationProfileId'] = nab_cws_client.application_profile_id

		request = Nab.recursive_merge(defaults, request)

		workflow_id = URI::encode(nab_cws_client.workflow_id)
		
		nab_cws_client.last_call = self.name + '::' + __method__.to_s
		nab_cws_client.send("#{RbConfig::BasePath}/txn/#{workflow_id}/#{request['DifferenceData']['TransactionId']}", request, Net::HTTP::Put, RbConfig::BaseURL)
	end

  def self.return_by_id(nab_cws_client, request)
    defaults={
      '$type' => 'ReturnById,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Rest',
      :ApplicationProfileId => '',
      :MerchantProfileId => '',
      :DifferenceData => {
        '$type' => 'BankcardReturn,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Bankcard',
        :TransactionDateTime => '2012-03-22T14:57:28-06:00',
        :TransactionId => '--Transaction ID Required--',
        :Amount => '1.00', # If amount is not set the full amount authorized will be returned.
        :Addendum => nil
      }
    }
    
    defaults['ApplicationProfileId'] = nab_cws_client.application_profile_id
    defaults['MerchantProfileId'] = nab_cws_client.merchant_profile_id


    request = Nab.recursive_merge(defaults, request)

    workflow_id = URI::encode(nab_cws_client.workflow_id)
    
    nab_cws_client.last_call = self.name + '::' + __method__.to_s
    nab_cws_client.send(RbConfig::BasePath + '/txn/'+ workflow_id, request, Net::HTTP::Post, RbConfig::BaseURL)
  end
  def self.return_unlinked_encrypted(nab_cws_client, request)
    defaults= {
      '$type' => 'AuthorizeTransaction,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Rest',
      :ApplicationProfileId => 'XXXX',
      :MerchantProfileId => 'XXXX',
      :Transaction => {
        '$type' => 'BankcardTransaction,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Bankcard',
        
        :TenderData => {
          :SecurePaymentAccountData => '87936F09AE06386BA4CD81ADFF7DF0FA5AC1B28EF9F7B7075E415545F9B9095C0AC5FA12B9905325', #Encrypted Track 2 data returned by MagneSafe device when card is swiped.
          :CardSecurityData => {
             :IdentificationInformation => '9ED72A486AB36DC352957C2C00607E937D1D90CB8B09A8588629AABA8EAF0FD65296A4FBA490EECFCD8D5B350438C4BFA6A36FFA2ADAAA3E', # Encrypted MagnePrint� Information returned by the MagneSafe� device when card is swiped.
            },
            :EncryptionKeyId => '9010010B0C2472000021',  # 20-character string returned by MagneSafe device when card is swiped.
            :SwipeStatus => '00304061', # MagnePrint Status of Card Swipe. This is an alpha numeric string, returned by MagneSafe device when card is swiped.
            :DeviceSerialNumber => 'B0C2472071812AA'

        },
        'TransactionData' => {
          'Amount' => '10.00',
          'CurrencyCode' => Nab::TypeISOCurrencyCodeA3::USD,
          'TransactionDateTime' => '2012-03-22T14:57:28-06:00',
          'ApprovalCode' => nil, # Only set this for Force Post Voice Authorized transactions.
          'CashBackAmount' => '0.00', # Used only for PINDebit transactions
          'CustomerPresent' => Config::TxnData_CustomerPresent,
          'EmployeeId' => '1234',
          'EntryMode' => Config::TxnData_EntryMode,
          'OrderNumber' => '12345',
          'Reference' => '11', # This needs to be a unique value for each transaction
          'SignatureCaptured' => true, # set to true if signature is captured physically or digitally
          'TipAmount' => '0.00'
        }
      }
    }

    defaults['MerchantProfileId'] = nab_cws_client.merchant_profile_id
    defaults['ApplicationProfileId'] = nab_cws_client.application_profile_id

    request = Nab.recursive_merge(defaults, request)

    workflow_id = URI::encode(nab_cws_client.workflow_id)

    nab_cws_client.last_call = self.name + '::' + __method__.to_s
    nab_cws_client.send( Config::BasePath + '/txn/'+ workflow_id, request, Net::HTTP::Post, Config::BaseURL)
  end
  
	def self.return_unlinked(nab_cws_client, request)
		defaults={
			'$type' => 'ReturnTransaction,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Rest',
						:ApplicationProfileId => '',
			:MerchantProfileId => '',
			:Transaction => {
				'$type' => 'BankcardTransaction,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Bankcard',
				
				:TenderData => {
					:PaymentAccountDataToken => nil,  # Used in place of Card Data
					:SecurePaymentAccountData => nil,
					:CardData => {
						:CardType => Nab::TypeCardType::MasterCard,
						:CardholderName => nil,
						:PAN => '5454545454545454',
						:Expire => '1215',
						:Track1Data => nil,
						:Track2Data => nil
					},
					# AVS Data is optional.  For Keyed transactions the Postal Code will help qualify your transaction for lower interchange
					:CardSecurityData => {
						:AVSData => {
							:CardholderName => 'SJohnson',
							:Street => '777 Cherry Street',
							:City => 'Denver',
							:StateProvince => 'CO',
							:PostalCode => '80220',
							:Country => Nab::ISOCountryCodeA3::USA,
							:Phone => nil
						},
						 # CVData is optional
						:CVDataProvided => Nab::CVDataProvided::Provided,
						:CVData => '123',
						:KeySerialNumber => nil,
						:PIN => nil
					}
				},
				:TransactionData => {
					:Amount => '10.00',
					:CurrencyCode => Nab::TypeISOCurrencyCodeA3::USD,
					:TransactionDateTime => '2012-03-22T14:57:28-06:00',
					#'AccountType' => Nab::AccountType::NotSet, # Used only for PINDebit transactions
					:ApprovalCode => nil, # Only set this for Force Post Voice Authorized transactions.
					:CashBackAmount => '0.00', # Used only for PINDebit transactions
					:CustomerPresent => RbConfig::TxnData_CustomerPresent,
					:EmployeeId => '1234',
					:EntryMode => RbConfig::TxnData_EntryMode,
					# 'GoodsType' => Nab::GoodsType::DigitalGoods, # Used only for Ecommerce IndustryType transactions
					#'InternetTransactionData' => {
						#'IpAddress' => '1.1.1.1',
						#'SessionId' => '12345'
					#},
					#'InvoiceNumber' => nil,
					:OrderNumber => '12345',
					#'IsPartialShipment' => false, # Used in Ecommerce/MOTO
					:SignatureCaptured => false, # set to true if signature is captured physically or digitally
					:TipAmount => '0.00',
          :TransactionCode => Nab::TransactionCode::NotSet  # Only use the Override flag if you wish to force a duplicate authorization through for the same card - same amount
				}
			}
		}

		defaults['ApplicationProfileId'] = nab_cws_client.application_profile_id
		defaults['MerchantProfileId'] = nab_cws_client.merchant_profile_id

		request = Nab.recursive_merge(defaults, request)

		nab_cws_client.last_call = self.name + '::' + __method__.to_s
		nab_cws_client.send(RbConfig::BasePath + '/txn/'+nab_cws_client.workflow_id, request, Net::HTTP::Post, RbConfig::BaseURL)
	end


	def self.capture_all(nab_cws_client, request)
		defaults={
			'$type' => 'CaptureAll,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Rest',
			:ApplicationProfileId => '',
			:MerchantProfileId => ''
		}

		defaults['ApplicationProfileId'] = nab_cws_client.application_profile_id
		defaults['MerchantProfileId'] = nab_cws_client.merchant_profile_id

		request = Nab.recursive_merge(defaults, request)

		workflow_id = URI::encode(nab_cws_client.workflow_id)
		
		nab_cws_client.last_call = self.name + '::' + __method__.to_s
		nab_cws_client.send("#{RbConfig::BasePath}/txn/#{workflow_id}", request, Net::HTTP::Put, RbConfig::BaseURL)
	end


	def self.capture_selective(nab_cws_client, request)
		defaults={
			'$type' => 'CaptureSelective,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Rest',
			:ApplicationProfileId => '',
			:TransactionIds => [],
			:DifferenceData => {
				:Capture => [{
					:Amount => '10.00',
					:TransactionId => '',
					:TipAmount => '0.00',
					:Addendum => nil
				}]
			}
		}

		defaults['ApplicationProfileId'] = nab_cws_client.application_profile_id

		request = Nab.recursive_merge(defaults, request)

		workflow_id = URI::encode(nab_cws_client.workflow_id)
		
		nab_cws_client.last_call = self.name + '::' + __method__.to_s
		nab_cws_client.send(RbConfig::BasePath + '/txn/'+workflow_id, request, Net::HTTP::Put, RbConfig::BaseURL)
	end

end
end
