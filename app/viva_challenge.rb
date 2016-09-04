class API::VivaChallenge < Grape::API
  mount API::Spotippos

  add_swagger_documentation
end
