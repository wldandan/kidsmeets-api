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

        get '/list' do
          KidsMeets::Models::Event.all.as_json
        end

        post do
          #require 'debugger';debugger
          event = KidsMeets::Models::Event.create!(
              title: params[:title],
              description: params[:description]
          )
          event.as_json
        end

      end
    end
  end
end
