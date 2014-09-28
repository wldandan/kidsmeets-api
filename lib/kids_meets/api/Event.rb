require 'grape'

module KidsMeets
  module Api

    class Event < Grape::API

      format :json
      version 'v1', :using => :header, :vendor => 'rea' do

        desc 'get_all_available_events'
        get '/' do
          "hello world"
        end

      end
    end
  end
end
