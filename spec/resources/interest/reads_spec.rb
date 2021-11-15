require 'rails_helper'

RSpec.describe InterestResource, type: :resource do
  describe 'serialization' do
    let!(:interest) { create(:interest) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(interest.id)
      expect(data.jsonapi_type).to eq('interests')
    end
  end

  describe 'filtering' do
    let!(:interest1) { create(:interest) }
    let!(:interest2) { create(:interest) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: interest2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([interest2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:interest1) { create(:interest) }
      let!(:interest2) { create(:interest) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            interest1.id,
            interest2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            interest2.id,
            interest1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
