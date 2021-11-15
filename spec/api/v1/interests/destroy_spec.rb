require 'rails_helper'

RSpec.describe "interests#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/interests/#{interest.id}"
  end

  describe 'basic destroy' do
    let!(:interest) { create(:interest) }

    it 'updates the resource' do
      expect(InterestResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Interest.count }.by(-1)
      expect { interest.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
