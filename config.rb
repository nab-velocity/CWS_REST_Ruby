module RbConfig

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
 # Software-Restricted Rights Clause at FAR 52.227-19 subparagraph
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

   #
   # Identity Token : Identity tokens are signed authentication tokens provided to merchants or other transaction originators to prevent the unauthorized use
   # of an application. Identity tokens are set to expire after 3 years, and therefore will require renewal. Identity tokens should be managed and protected in a
   # manner consistent with current key management best practices which may include access control, encryption, or use of specialized security devices. Identity
   # token owners are responsible for establishing practices for managing sensitive data like any other secure credential or business certificate.
   #
   #
  
  ActivationKey = ''
  MerchantType = 'Managed' # Managed or Unmanaged
  #Host Capture
  IdentityToken = 'PHNhbWw6QXNzZXJ0aW9uIE1ham9yVmVyc2lvbj0iMSIgTWlub3JWZXJzaW9uPSIxIiBBc3NlcnRpb25JRD0iX2YwYzdlOWQyLWIxOGMtNGE3NS1hMTI1LWIyOTNjMjBkNGZiMyIgSXNzdWVyPSJJcGNBdXRoZW50aWNhdGlvbiIgSXNzdWVJbnN0YW50PSIyMDE0LTA0LTAyVDE5OjIzOjM1LjExOFoiIHhtbG5zOnNhbWw9InVybjpvYXNpczpuYW1lczp0YzpTQU1MOjEuMDphc3NlcnRpb24iPjxzYW1sOkNvbmRpdGlvbnMgTm90QmVmb3JlPSIyMDE0LTA0LTAyVDE5OjIzOjM1LjExOFoiIE5vdE9uT3JBZnRlcj0iMjAxNy0wNC0wMlQxOToyMzozNS4xMThaIj48L3NhbWw6Q29uZGl0aW9ucz48c2FtbDpBZHZpY2U+PC9zYW1sOkFkdmljZT48c2FtbDpBdHRyaWJ1dGVTdGF0ZW1lbnQ+PHNhbWw6U3ViamVjdD48c2FtbDpOYW1lSWRlbnRpZmllcj5BRkY0RjYyRTNEQjAwMDAxPC9zYW1sOk5hbWVJZGVudGlmaWVyPjwvc2FtbDpTdWJqZWN0PjxzYW1sOkF0dHJpYnV0ZSBBdHRyaWJ1dGVOYW1lPSJTQUsiIEF0dHJpYnV0ZU5hbWVzcGFjZT0iaHR0cDovL3NjaGVtYXMuaXBjb21tZXJjZS5jb20vSWRlbnRpdHkiPjxzYW1sOkF0dHJpYnV0ZVZhbHVlPkFGRjRGNjJFM0RCMDAwMDE8L3NhbWw6QXR0cmlidXRlVmFsdWU+PC9zYW1sOkF0dHJpYnV0ZT48c2FtbDpBdHRyaWJ1dGUgQXR0cmlidXRlTmFtZT0iU2VyaWFsIiBBdHRyaWJ1dGVOYW1lc3BhY2U9Imh0dHA6Ly9zY2hlbWFzLmlwY29tbWVyY2UuY29tL0lkZW50aXR5Ij48c2FtbDpBdHRyaWJ1dGVWYWx1ZT5hZDQwMWQ1Yy1hNzZmLTRlYWItYmU5ZC1mNjU2NjlmOWE0ZTg8L3NhbWw6QXR0cmlidXRlVmFsdWU+PC9zYW1sOkF0dHJpYnV0ZT48c2FtbDpBdHRyaWJ1dGUgQXR0cmlidXRlTmFtZT0ibmFtZSIgQXR0cmlidXRlTmFtZXNwYWNlPSJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcyI+PHNhbWw6QXR0cmlidXRlVmFsdWU+QUZGNEY2MkUzREIwMDAwMTwvc2FtbDpBdHRyaWJ1dGVWYWx1ZT48L3NhbWw6QXR0cmlidXRlPjwvc2FtbDpBdHRyaWJ1dGVTdGF0ZW1lbnQ+PFNpZ25hdHVyZSB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC8wOS94bWxkc2lnIyI+PFNpZ25lZEluZm8+PENhbm9uaWNhbGl6YXRpb25NZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzEwL3htbC1leGMtYzE0biMiPjwvQ2Fub25pY2FsaXphdGlvbk1ldGhvZD48U2lnbmF0dXJlTWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMC8wOS94bWxkc2lnI3JzYS1zaGExIj48L1NpZ25hdHVyZU1ldGhvZD48UmVmZXJlbmNlIFVSST0iI19mMGM3ZTlkMi1iMThjLTRhNzUtYTEyNS1iMjkzYzIwZDRmYjMiPjxUcmFuc2Zvcm1zPjxUcmFuc2Zvcm0gQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjZW52ZWxvcGVkLXNpZ25hdHVyZSI+PC9UcmFuc2Zvcm0+PFRyYW5zZm9ybSBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvMTAveG1sLWV4Yy1jMTRuIyI+PC9UcmFuc2Zvcm0+PC9UcmFuc2Zvcm1zPjxEaWdlc3RNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjc2hhMSI+PC9EaWdlc3RNZXRob2Q+PERpZ2VzdFZhbHVlPlpsS0M5Qi9FUC9nK0hGOGFFUzQ4V3dpejAvWT08L0RpZ2VzdFZhbHVlPjwvUmVmZXJlbmNlPjwvU2lnbmVkSW5mbz48U2lnbmF0dXJlVmFsdWU+bDlaYng5Q25aOE5ab053blYyR1FwMzBVTi93eTBKN2ZOeENianB3Qkw2QUNueU4zMkU2eVBNQWZoZkdrVWljclBHODdVVDNTa3Y5cjVIUkRYY1E2YVJFcWgvUnZ4QmpBY2lIWWVZSnNSa28xc3c0TmdTNGRSa3IwcWhnQm5YdUxiWnowU1llaGJIVlUrWFNPQTVOM0N0ckFkenk3UzY4L1RlWVJBQUl1YzhONXUwSkV2N0NyTHRaSFFZZTluTE5sZW1BZ0wyeUQrQ2hpMmQ0aFBMREdIclJQVHMxMGJYcm1Idm9NZ1dyUUFFWGdUTXBKaENtNndWUU9BbjM4RkhKOUd4OVY3U2RackhGaTJHVlFUeXhCdUhEV1Irb1NmSTJSekxqV2FlTUd6aFpVYnJOMkJXeEN4WnFJdU1aNVMybDZpYzRjZHR3UU5oZ3F2VlVXdFI3QllnPT08L1NpZ25hdHVyZVZhbHVlPjxLZXlJbmZvPjxvOlNlY3VyaXR5VG9rZW5SZWZlcmVuY2UgeG1sbnM6bz0iaHR0cDovL2RvY3Mub2FzaXMtb3Blbi5vcmcvd3NzLzIwMDQvMDEvb2FzaXMtMjAwNDAxLXdzcy13c3NlY3VyaXR5LXNlY2V4dC0xLjAueHNkIj48bzpLZXlJZGVudGlmaWVyIFZhbHVlVHlwZT0iaHR0cDovL2RvY3Mub2FzaXMtb3Blbi5vcmcvd3NzL29hc2lzLXdzcy1zb2FwLW1lc3NhZ2Utc2VjdXJpdHktMS4xI1RodW1icHJpbnRTSEExIj5ZREJlRFNGM0Z4R2dmd3pSLzBwck11OTZoQ2M9PC9vOktleUlkZW50aWZpZXI+PC9vOlNlY3VyaXR5VG9rZW5SZWZlcmVuY2U+PC9LZXlJbmZvPjwvU2lnbmF0dXJlPjwvc2FtbDpBc3NlcnRpb24+'
  #Terminal Capture --> IdentityToken = 'PHNhbWw6QXNzZXJ0aW9uIE1ham9yVmVyc2lvbj0iMSIgTWlub3JWZXJzaW9uPSIxIiBBc3NlcnRpb25JRD0iXzdkMTc0ODM2LWZhNTUtNGYwMS1iMTBlLTUwNDdlMzAzY2Q2MiIgSXNzdWVyPSJJcGNBdXRoZW50aWNhdGlvbiIgSXNzdWVJbnN0YW50PSIyMDE0LTAzLTI0VDE5OjQ2OjQ3LjY2NFoiIHhtbG5zOnNhbWw9InVybjpvYXNpczpuYW1lczp0YzpTQU1MOjEuMDphc3NlcnRpb24iPjxzYW1sOkNvbmRpdGlvbnMgTm90QmVmb3JlPSIyMDE0LTAzLTI0VDE5OjQ2OjQ3LjY2NFoiIE5vdE9uT3JBZnRlcj0iMjAxNy0wMy0yNFQxOTo0Njo0Ny42NjRaIj48L3NhbWw6Q29uZGl0aW9ucz48c2FtbDpBZHZpY2U+PC9zYW1sOkFkdmljZT48c2FtbDpBdHRyaWJ1dGVTdGF0ZW1lbnQ+PHNhbWw6U3ViamVjdD48c2FtbDpOYW1lSWRlbnRpZmllcj42NkFCMDUyMjAyNjAwMDAxPC9zYW1sOk5hbWVJZGVudGlmaWVyPjwvc2FtbDpTdWJqZWN0PjxzYW1sOkF0dHJpYnV0ZSBBdHRyaWJ1dGVOYW1lPSJTQUsiIEF0dHJpYnV0ZU5hbWVzcGFjZT0iaHR0cDovL3NjaGVtYXMuaXBjb21tZXJjZS5jb20vSWRlbnRpdHkiPjxzYW1sOkF0dHJpYnV0ZVZhbHVlPjY2QUIwNTIyMDI2MDAwMDE8L3NhbWw6QXR0cmlidXRlVmFsdWU+PC9zYW1sOkF0dHJpYnV0ZT48c2FtbDpBdHRyaWJ1dGUgQXR0cmlidXRlTmFtZT0iU2VyaWFsIiBBdHRyaWJ1dGVOYW1lc3BhY2U9Imh0dHA6Ly9zY2hlbWFzLmlwY29tbWVyY2UuY29tL0lkZW50aXR5Ij48c2FtbDpBdHRyaWJ1dGVWYWx1ZT5iZDA4MTI1NC0xNTJjLTQ5ZmUtYmVjNy1hNzhmNWRmYTM3NmY8L3NhbWw6QXR0cmlidXRlVmFsdWU+PC9zYW1sOkF0dHJpYnV0ZT48c2FtbDpBdHRyaWJ1dGUgQXR0cmlidXRlTmFtZT0ibmFtZSIgQXR0cmlidXRlTmFtZXNwYWNlPSJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcyI+PHNhbWw6QXR0cmlidXRlVmFsdWU+NjZBQjA1MjIwMjYwMDAwMTwvc2FtbDpBdHRyaWJ1dGVWYWx1ZT48L3NhbWw6QXR0cmlidXRlPjwvc2FtbDpBdHRyaWJ1dGVTdGF0ZW1lbnQ+PFNpZ25hdHVyZSB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC8wOS94bWxkc2lnIyI+PFNpZ25lZEluZm8+PENhbm9uaWNhbGl6YXRpb25NZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzEwL3htbC1leGMtYzE0biMiPjwvQ2Fub25pY2FsaXphdGlvbk1ldGhvZD48U2lnbmF0dXJlTWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMC8wOS94bWxkc2lnI3JzYS1zaGExIj48L1NpZ25hdHVyZU1ldGhvZD48UmVmZXJlbmNlIFVSST0iI183ZDE3NDgzNi1mYTU1LTRmMDEtYjEwZS01MDQ3ZTMwM2NkNjIiPjxUcmFuc2Zvcm1zPjxUcmFuc2Zvcm0gQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjZW52ZWxvcGVkLXNpZ25hdHVyZSI+PC9UcmFuc2Zvcm0+PFRyYW5zZm9ybSBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvMTAveG1sLWV4Yy1jMTRuIyI+PC9UcmFuc2Zvcm0+PC9UcmFuc2Zvcm1zPjxEaWdlc3RNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjc2hhMSI+PC9EaWdlc3RNZXRob2Q+PERpZ2VzdFZhbHVlPnNuUGs5dlFSTmwzOUhQdDhsZWg0TGdHckNocz08L0RpZ2VzdFZhbHVlPjwvUmVmZXJlbmNlPjwvU2lnbmVkSW5mbz48U2lnbmF0dXJlVmFsdWU+UDhKRk9rSFlwRTVtSUNSOW85eFJDamlOdjg5K3VWUGR6aHJEb3ZTOGM2R0RlcFJsK1lYMjVUcXNjdkxrQkhKcCsvQlFYRnMwWno0WURRS3R2a1ZaNlZ2RDB4d2pzOXNiNmRrUm1DcDRZRWJGVjR1bm9pbVFtZ3orckFaN1dyb09jaDlMMlowS2EyMXUwbG1UdzU1bHVpcUlmMzhOY3E5ZWV5eCtzMnl2ckl4YmZTZmtjcUErR2ZLQXdaQmhMNmZQeVFTekJXL01nL3VNOXM5UGM4aklXclJtUzdQajRMRER1d3ZvTE5xL2JKOS9vdUJBZDdXbUE4eklNa1IxUkRrWlErR29mREluWnF3aXk5SUZ5ZkY5MVgzUytoRDZqeUVFMGtPMFREVHZlcHpBY3MwNDZKNEUwZ1lHT0toNjg2UktmY0N0QWxNbVNKV0tIai8vU01uU0lBPT08L1NpZ25hdHVyZVZhbHVlPjxLZXlJbmZvPjxvOlNlY3VyaXR5VG9rZW5SZWZlcmVuY2UgeG1sbnM6bz0iaHR0cDovL2RvY3Mub2FzaXMtb3Blbi5vcmcvd3NzLzIwMDQvMDEvb2FzaXMtMjAwNDAxLXdzcy13c3NlY3VyaXR5LXNlY2V4dC0xLjAueHNkIj48bzpLZXlJZGVudGlmaWVyIFZhbHVlVHlwZT0iaHR0cDovL2RvY3Mub2FzaXMtb3Blbi5vcmcvd3NzL29hc2lzLXdzcy1zb2FwLW1lc3NhZ2Utc2VjdXJpdHktMS4xI1RodW1icHJpbnRTSEExIj5ZREJlRFNGM0Z4R2dmd3pSLzBwck11OTZoQ2M9PC9vOktleUlkZW50aWZpZXI+PC9vOlNlY3VyaXR5VG9rZW5SZWZlcmVuY2U+PC9LZXlJbmZvPjwvU2lnbmF0dXJlPjwvc2FtbDpBc3NlcnRpb24+'
  # encryption key value
  Key = '1234567890123456ABCDEFGHIJKLMNOP' # Used for Salt for encryption and decryption.  You should generate your Salt and not use the default key provided
  UseWorkflow = false  # true/false whether or not to use workflows associated to ServiceKey
  # Application Data Values 
  ApplicationName = 'My Test App'
  SoftwareVersion = 'v1.0'
  SoftwareVersionDate = '2014-1-01'
  DeviceSerialNumber = '1264682310'
  ApplicationAttended = true   # Valid Values "true", "false"
  ApplicationLocation = 'OnPremises' # Valid Values "Unknown", "OnPremises", "OffPremises", "HomeInternet"
  PINCapability = 'PINSupported' # Valid Values "PINNotSupported", "PINPadInoperative", "PINSupported", "PINVerifiedByDevice", "Unknown"
  ReadCapability = 'HasMSR' # Common Value Used "HasMSR", "KeyOnly"
  PTLSSocketId = 'MIIFCzCCA/OgAwIBAgICAoEwDQYJKoZIhvcNAQEFBQAwgbExNDAyBgNVBAMTK0lQIFBheW1lbnRzIEZyYW1ld29yayBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkxCzAJBgNVBAYTAlVTMREwDwYDVQQIEwhDb2xvcmFkbzEPMA0GA1UEBxMGRGVudmVyMRowGAYDVQQKExFJUCBDb21tZXJjZSwgSW5jLjEsMCoGCSqGSIb3DQEJARYdYWRtaW5AaXBwYXltZW50c2ZyYW1ld29yay5jb20wHhcNMTMwODI2MTcxMDI3WhcNMjMwODI0MTcxMDI3WjCBjDELMAkGA1UEBhMCVVMxETAPBgNVBAgTCENvbG9yYWRvMQ8wDQYDVQQHEwZEZW52ZXIxGjAYBgNVBAoTEUlQIENvbW1lcmNlLCBJbmMuMT0wOwYDVQQDEzR0ZHNwM25TZ0FJQUFBUDhBSCtDWUFBQUVBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUE9MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtn6ILI78EaOLcWrmI9RZf8Vj+3P/WcrDLimSyJJH/8LnIBbXNkiKcZSMg/KHqNLAtq/ncYqZcicgAfaoSbj9FxKGIXTDEICriv/i8sQIGFhIwW/V6H02E8SpWjdCQO9EUUaFPUVMhHfiabwJ3B0VODsQfVuG7mbrAvD/wAqiUVR2Q0rpgHkToCkytdhMlkXiFtnfy4nnoFnI6c5cmsQU7AZgI6Zr08pDMN9y3uSRGSJIzdcTohBA1qb8C4+ZVRCmwCfQZiBHxjC8c5DTiGlPQVEDfRjKXm6ffqBKCttX7qCeB0s57iob0Q7ucz8NfoWtY8dZVzMhYH8obU/dSXaZ6wIDAQABo4IBTjCCAUowCQYDVR0TBAIwADAdBgNVHQ4EFgQUJ64+T3k9d5nWfplPlxVZsN382XUwgeYGA1UdIwSB3jCB24AU3+ASnJQimuunAZqQDgNcnO2HuHShgbekgbQwgbExNDAyBgNVBAMTK0lQIFBheW1lbnRzIEZyYW1ld29yayBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkxCzAJBgNVBAYTAlVTMREwDwYDVQQIEwhDb2xvcmFkbzEPMA0GA1UEBxMGRGVudmVyMRowGAYDVQQKExFJUCBDb21tZXJjZSwgSW5jLjEsMCoGCSqGSIb3DQEJARYdYWRtaW5AaXBwYXltZW50c2ZyYW1ld29yay5jb22CCQD/yDY5hYVsVzA1BgNVHR8ELjAsMCqgKKAmhiRodHRwOi8vY3JsLmlwY29tbWVyY2UuY29tL2NhLWNybC5jcmwwDQYJKoZIhvcNAQEFBQADggEBAJrku2QD0T/0aT+jfFJA947Vf7Vu/6S1OxUGhMipx6z/izXZ+o4fK/Nsg0G39KvfxippFG/3MUo621dwXwtqq9SM72zy9ry9E0ptmEiG8X8bSVOyGj4MqyExCPs9LgloV5GgewqYRgq2hmbXOv8Gw7EeXGCfnQ+eROxGu1+p3ZWUnGMQnBbayg43npcHYfyLFHOzd57pj6ncYoxY3kun5GLMLr6tJXKpPNvbM5lAOzcAmKviPMCM2T53UzJlsRdVvCbnkrc5cYqN4l01elqr3MSsj6BJ+JqIqViFrYYkD34THKO8c+wZGb8IN+NJAVre9YOvt5+Cvbbd5ik0UQ+YQNM='
  EncryptionType = 'MagneSafeV4V5Compatible' # Valid Values "IPADV1Compatible", "MagneSafeV4V5Compatible", "NotSet"
  
  # MerchantProfile Values 
  IndustryType = 'Retail' # Valid Values "Ecommerce", "MOTO", "Retail", "Restaurant"
  CustomerPresent = 'Present' # Common Values Used [Ecommerce : Ecommerce] [MOTO : MOTO] [Retail/Restaurant : Present]
  RequestACI = 'IsCPSMeritCapable' # In general default to "IsCPSMeritCapable". Other value is "NotCPSMeritCapable"
  EntryMode = 'TrackDataFromMSR' # Valid Values [Ecommerce/MOTO : Keyed] [Retail/Restaurant : Keyed/TrackDataFromMSR]
  
  # TransactionData Values 
  
  TxnData_ProcessAsKeyed = false   # "true", "false" Depending on industrytype toggle between a swipe example and a keyed transaction
  TxnData_EntryMode = 'TrackDataFromMSR' # [Ecommerce/MOTO : Keyed] [Retail/Restaurant : Keyed/TrackDataFromMSR]
  TxnData_OrderOfProcessingTracks = 'Track2|Track1|Keyed' # The order consists of three values seperated by Pipe. Ex. Track2|Track1|Keyed
  TxnData_ProcessMagensaTxn = true # Magensa is an End to End encryptions solution offered through MagTek
  TxnData_IndustryType = 'Retail' # Valid Values "Ecommerce", "MOTO", "Retail", "Restaurant"
  TxnData_CustomerPresent = 'Present' # [Ecommerce : Ecommerce] [MOTO : MOTO] [Retail/Restaurant : Present]
  TxnData_UserId = 'UTest' # Some services require a UserId and Password
  TxnData_Password = 'UPassword' # Some services require a UserId and Password
 
  # ** ALL THE FOLOWING WERE IN SINGLE QUOTES IN HTTP
  TxnData_SignatureCaptured = true   # "true", "false" - For retail/restaurant should be configurable in their software and should be marked whether or not software actually gets the signature for each transaction
  TxnData_IncludeAVS = false   # "true", "false"
  TxnData_IncludeCV = false      # "true", "false"
  TxnData_IncludeVPAS = false    # "true", "false"
  TxnData_IncludeUCAF = false    # "true", "false"
  TxnData_IncludeCFees = false   # "true", "false"
  TxnData_SoftDescriptors = false    # "true", "false"
  # Support Tokenization
  TxnData_SupportTokenization = true # "true", "false"
  TxnData_ProcessEncrypted = false

  # Process as a BankcardTransaction object or as a BankcardTransactionPro object
  ProcessAsBankcardTransaction_Pro = false   # "true", "false" If set to true the following Pro parameters are required
  # THE FOLLOWING WAS "true" NOT LEVEL1 IN HTTP
  Pro_PurchaseCardLevel = 'Level1' # "Level1", "Level2", "Level3"
  Pro_InterchangeData = false    # "true", "false"
  Pro_IncludeLevel2OrLevel3Data = false    # "true", "false"
  Pro_IncludeAlternativeMerchantData = false   # "true", "false"
  
  # ACH Transaction Data Values
  TxnData_SECCode = 'WEB' #  WEB,PPD,CCD,BOC,TEL The three letter code that indicates what NACHA regulations the transaction must adhere to. Required.
  TxnData_ServiceType = 'ACH' # Indicates the Electronic Checking service type: ACH, RDC or ECK. Required.
  
  # Endpoint Management
  BaseURL = 'api.cert.nabcommerce.com'
  BasePath = '/REST/2.0.18'
  
  # Merchant Profile Information
  ServiceID = ''
  MerchantProfileId = '' # TDC profile to use: TestMerchant_4C85600001, HDC Profile to Use: TestMerchant_39C6700001
  WorkflowId = '' # Magensa HDC WorkflowId: A121700001 HDC ServiceId: 39C6700001, Magensa TDC WorkflowId: A1F1A00001, TDC ServiceId: 4C85600001
  ApplicationProfileId = ''

end
