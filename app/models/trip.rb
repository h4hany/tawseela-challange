class Trip < ApplicationRecord
  enum status: {planning: 0, ongoing: 1, completed: 2}
  validates :status, inclusion: {in: %w(planning ongoing completed), message: 'Not Expected Status'}
  validate :status_sequence, on: :update

  after_update :cache_trip, if: -> {status == 'ongoing'}

  after_update :deleted_cache_trip, if: -> {status == 'completed'}

  has_many :locations

  def status_sequence
    if (status_was == 'planning' && status == 'completed') || (status_was == 'completed' && status == 'ongoing') || (status_was == 'completed' && status == 'planning')
      errors.add(:status, "can't change status form #{status_was} to #{status}")
    end
  end

  def cache_trip
    Rails.cache.write("trip_#{id}", self)
  end

  def deleted_cache_trip
    Rails.cache.delete("trip_#{id}")
  end

end
