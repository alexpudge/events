class Api::V1::InterestsController < Api::V1::GraphitiController
  def index
    interests = InterestResource.all(params)
    respond_with(interests)
  end

  def show
    interest = InterestResource.find(params)
    respond_with(interest)
  end

  def create
    interest = InterestResource.build(params)

    if interest.save
      render jsonapi: interest, status: 201
    else
      render jsonapi_errors: interest
    end
  end

  def update
    interest = InterestResource.find(params)

    if interest.update_attributes
      render jsonapi: interest
    else
      render jsonapi_errors: interest
    end
  end

  def destroy
    interest = InterestResource.find(params)

    if interest.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: interest
    end
  end
end
