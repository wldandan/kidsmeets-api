require 'grape'

require_relative 'api/event'

module KidsMeets
  class API < Grape::API

    logger KidsMeets::App.logger

    before do
      API.logger.debug "[api] #{request.ip} START #{request.request_method} #{request.url}"
    end

    after do
      API.logger.debug "[api] #{request.ip} FINISH #{request.request_method} #{request.url}"
    end

    rescue_from :all do |e|
      API.logger.error("Exception #{e.class.name} #{e.message}")
      e.backtrace.each { |bt| API.logger.error("-- #{bt}") }

      rack_response(
        {
          :error => e.message,
          :type => e.class.name,
        }.to_json, 500
      )
    end

    content_type :json, 'application/json'
    content_type :xml, 'text/xml'
    default_format :json

    mount Api::Event
  end
end
