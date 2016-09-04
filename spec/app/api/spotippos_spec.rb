require 'spec_helper'

describe API::Spotippos do
  describe "POST /properties" do
    context "when all params is full filled" do
      let(:response) do
        post "/v1/properties", load_json("new_property_full"), { 'CONTENT_TYPE' => 'application/json' }
      end

      it { expect(response.status).to eq 201 }
    end
  end

  describe "GET /properties/{id}" do
    context "when id param is not number" do
      let(:response) { get "/v1/properties/is_nan" }

      it { expect(response.status).to eq 400 }
    end

    context "when not found in database" do
      let(:response) { get "/v1/properties/666" }
      let(:body) { JSON.parse response.body }

      it { expect(response.status).to eq 404 }
      it { expect(body["error"]).to eq "404 Not Found" }
    end

    context "when found in database" do
      before do
        create :property
        get "/v1/properties/1"
      end

      let(:body) { JSON.parse last_response.body }

      it { expect(last_response.status).to eq 200 }
      it { expect(body["x"]).to eq 222 }
      it { expect(body["y"]).to eq 444 }
      it { expect(body["title"]).to eq "Lindo apartamento" }
      it { expect(body["price"]).to eq 100000 }
      it { expect(body["description"]).to eq "Lindo apartamento com uma linda descrição" }
      it { expect(body["beds"]).to eq 5 }
      it { expect(body["baths"]).to eq 2 }
      it { expect(body["squareMeters"]).to eq 100 }
      it { expect(body["provinces"]).to include("Scavy") }
      it { expect(body["_links"]["self"]["href"]).not_to be_empty }
    end
  end

  describe "GET /properties?ax=200&ay=400&bx=250&ay=450" do
    context "when found properties" do
      before do
        create :property
        get "/v1/properties?ax=200&ay=400&bx=250&by=450"
      end

      let(:body) { JSON.parse last_response.body }

      it { expect(last_response.status).to eq 200 }
      it { expect(body['foundProperties']).to eq 1 }
    end

  end
end
