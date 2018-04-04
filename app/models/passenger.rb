class Passenger < ApplicationRecord
  has_many :trips

  def total_cost

    total = 0

    trips.each do |trip|
      total += trip.cost
    end

    return total
  end

end
