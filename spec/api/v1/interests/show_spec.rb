require "rails_helper"

RSpec.describe "interests#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/interests/#{interest.id}", params: params
  end

  describe "basic fetch" do
    let!(:interest) { create(:interest) }

    it "works" do
      expect(InterestResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("interests")
      expect(d.id).to eq(interest.id)
    end
  end
end
