require 'open-uri'
class Event < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :photo, PhotoUploader

  # Direct associations

  has_many   :guests,
             :class_name => "Interest",
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  belongs_to :host,
             :class_name => "User",
             :foreign_key => "user_id",
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    start_date
  end

end
