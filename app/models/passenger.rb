class Passenger < ApplicationRecord

  has_many :trips, -> { order(date: :desc) }, dependent: :nullify

  validates :name, presence: { message: "You need to provide a name" }
  validates :phone_num, presence: { message: "You need to provide a phone number" }

  def total_cost

    total = 0
    trips.each do |trip|
      total += trip.cost
    end

    return total
  end

end
