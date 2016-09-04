module API
  module Representer
    module Property
      include Roar::JSON::HAL
      include Roar::Hypermedia
      include Grape::Roar::Representer

      property :x
      property :y
      property :title
      property :price
      property :description
      property :beds
      property :baths
      property :squareMeters

      link :self do |opts|
        request = Grape::Request.new(opts[:env])
        "#{request.base_url}/v1/properties/#{id}"
      end
    end
  end
end
