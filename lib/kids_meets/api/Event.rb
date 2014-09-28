require 'grape'

module KidsMeets
  module Api
    class Event < Grape::API

      format :json
      version 'v1', :using => :header, :vendor => 'rea' do

        namespace :events do
          desc 'get_all_available_events'
          get '/' do
            KidsMeets::Models::Event.all.as_json
          end
        end

        namespace :event do
            get ":_id" do
              event = KidsMeets::Models::Event.find(params[:_id])
              error! "Not Found", 404 unless event
              event.as_json
            end

            put ":_id" do
              event = KidsMeets::Models::Event.find(params[:_id])
              error! "Not Found", 404 unless event
              values = {}
              values[:title] = params[:title] if params.key?(:title)
              values[:description] = params[:description] if params.key?(:description)
              event.update_attributes!(values)
              event.as_json
            end

            delete ":_id" do
              event = KidsMeets::Models::Event.find(params[:_id])
              error! "Not Found", 404 unless event
              event.destroy
              event.as_json
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
end
