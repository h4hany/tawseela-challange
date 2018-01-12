class TripWorker
  include Sidekiq::Worker

  def perform(obj)
    # Do something
    location = Location.new(obj)
    if location.save
      puts "Sidekiq insert locations to database"
    end
  end
end
