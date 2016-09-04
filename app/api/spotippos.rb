module API
  class Spotippos < Grape::API
    version 'v1', using: :path
    format :json
    formatter :json, Grape::Formatter::Roar
    parser 'hal+json', Grape::Parser::Json
    content_type 'hal+json', 'application/hal+json'
    content_type :json, 'application/json'

    helpers do
      def logger
        @logger ||= Logger.new(STDOUT)
      end
    end

    resource :properties do
      desc "Create a new Property"
      params do
        #Adicionar as regexp
        requires :x, allow_blank: false, desc: "X  coordenate"
        requires :y, allow_blank: false, desc: "Y coordenate"
        requires :title, allow_blank: false, desc: "Property Title"
        requires :price, allow_blank: false, desc: "Property price in cents"
        requires :description, desc: "Property description"
        requires :beds, desc: "Property beds quantity"
        requires :baths, desc: "Property baths quantity"
        requires :squareMeters, desc: "Property square meters"
      end

      post do
        logger.info "POST #{params.inspect}"
        property = Entity::Property.create! x: params[:x], y: params[:y], title: params[:title], price: params[:price], description: params[:description], beds: params[:beds], baths: params[:baths], squareMeters: params[:squareMeters]
        present property, with: API::Representer::Property
      end

      desc "GET a property"
      params do
        requires :id, type: Integer, desc: 'Property id'
      end
      get "/:id" do
        logger.info "GET /v1/properties/#{params[:id]}"
        property = Entity::Property.find(params[:id])
        if property
          return present property, with: API::Representer::Property
        end
        error!('404 Not Found', 404)
      end

      desc "Search properties"
      params do
        requires :ax, desc: "Coordenate point A X"
        requires :ay, desc: "Coodernate point A Y"
        requires :bx, desc: "Coodernate pont B X"
        requires :by, desc: "Coordenate point B Y"
      end
      get do
        logger.info "GET /v1/properties Params: #{params}"
      end
    end
  end
end
