require "rails_helper"

RSpec.describe "interests#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/interests/#{interest.id}", payload
  end

  describe "basic update" do
    let!(:interest) { create(:interest) }

    let(:payload) do
      {
        data: {
          id: interest.id.to_s,
          type: "interests",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(InterestResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { interest.reload.attributes }
    end
  end
end
