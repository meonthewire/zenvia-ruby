# encoding: UTF-8
require 'net/http'
require 'uri'

module Zenvia
  module Base
    ZENVIA_URL_BASE = 'https://api-rest.zenvia360.com.br/services'
    SEND_SMS = '/send-sms'

    private

    # params {String} - id_sms
    # params {String} - msg
    # params {Integer} - cel_phone
    # params {String} - schedule_date
    # params {String} - aggregateId
    # Example send_to_zenvia("you-id-sms", "message-in-140-caracteres", "5591111111111", "2014-08-22T14:55:00", "111")
    
    def send_to_zenvia(id_sms, cel_phone, msg, schedule_date, aggregateId)

      callbackOption = Zenvia.configuration.callbackOption
      callbackOption = "NONE" if callbackOption.blank?

      url = URI.parse(ZENVIA_URL_BASE + SEND_SMS)
      
      req = Net::HTTP::Post.new(url.path, initheader = 
        {
          'Content-Type' => 'application/json',
          'Accept' => 'application/json'
        })

      req.basic_auth Zenvia.configuration.account, Zenvia.configuration.code

      req.body =
        {
          "sendSmsRequest": 
          {
            "from": Zenvia.configuration.from,
            "to": cel_phone,
            "schedule": schedule_date,
            "msg": msg,
            "callbackOption": callbackOption,
            "id": id_sms,
            "aggregateId": aggregateId
          }
        }.to_json

      resp = Net::HTTP.start(url.host, url.port, use_ssl: true) do |http| 
        http.request(req)
      end

      case resp
      when Net::HTTPSuccess, Net::HTTPRedirection, Net::HTTPOK
        # OK
        parse_json_response(resp.body)
      else
        resp.body
      end

    end

    def parse_json_response(body)
      resp = JSON.parse body
      resp["sendSmsResponse"]
    end

  end

end