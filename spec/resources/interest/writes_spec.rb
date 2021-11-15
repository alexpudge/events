require "rails_helper"

RSpec.describe InterestResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "interests",
          attributes: {},
        },
      }
    end

    let(:instance) do
      InterestResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Interest.count }.by(1)
    end
  end

  describe "updating" do
    let!(:interest) { create(:interest) }

    let(:payload) do
      {
        data: {
          id: interest.id.to_s,
          type: "interests",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      InterestResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { interest.reload.updated_at }
      # .and change { interest.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:interest) { create(:interest) }

    let(:instance) do
      InterestResource.find(id: interest.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Interest.count }.by(-1)
    end
  end
end
