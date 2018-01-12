class Location < ApplicationRecord
  validates :latitude, :longitude, presence: true
  validate :trip_is_ongoing
  belongs_to :trip
  # before_validation :cache_location
  #
  # def cache_location
  #   debugger
  #   Rails.cache.write("location_#{id}", self)
  # end

  def trip_is_ongoing
    unless self.trip.status == 'ongoing'
      errors.add(:trip, 'Trip Must Be Ongoing to submit a location')
    end
  end

  def serializable_hash(options = nil)
    super({ only: %i[latitude longitude trip_id]}.merge(options || {}))
  end
end
