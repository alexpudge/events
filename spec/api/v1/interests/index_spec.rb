require 'rails_helper'

RSpec.describe "interests#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/interests", params: params
  end

  describe 'basic fetch' do
    let!(:interest1) { create(:interest) }
    let!(:interest2) { create(:interest) }

    it 'works' do
      expect(InterestResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['interests'])
      expect(d.map(&:id)).to match_array([interest1.id, interest2.id])
    end
  end
end
