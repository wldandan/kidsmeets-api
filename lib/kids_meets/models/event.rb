module KidsMeets
  module Models
    class Event
      include Mongoid::Document

      field :title, type: String, description: "Title of event."
      field :description, type: String, description: "description of event."
    end
  end
end
