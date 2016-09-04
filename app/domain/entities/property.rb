module Entity
  class Property
    include Mongoid::Document
    include Mongoid::Autoinc

    increments :id
    field :x, type: Integer
    field :y, type: Integer
    field :title, type: String
    field :price, type: Integer
    field :description, type: String
    field :beds, type: Integer
    field :baths, type: Integer
    field :squareMeters, type: Integer

    def self.search(ax, ay, bx, by)
      self.where(:x.gte => ax).and(:x.lte => bx).and(:y.gte => ay).and(:y.lte => by).all
    end

  end
end
