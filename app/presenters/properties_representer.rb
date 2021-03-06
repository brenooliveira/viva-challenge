module API
  module Representer
    module Properties
      include Roar::JSON::HAL
      include Roar::Hypermedia
      include Grape::Roar::Representer

      property :foundProperties
      collection :to_a, extend: API::Representer::Property, as: :properties

      def foundProperties
        self.count
      end

    end
  end
end
