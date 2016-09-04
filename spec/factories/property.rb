FactoryGirl.define do
  factory :property, class: Entity::Property do
    x 222
    y 444
    title "Lindo apartamento"
    price 100000
    description "Lindo apartamento com uma linda descrição"
    beds 5
    baths 2
    squareMeters 100
  end
end
