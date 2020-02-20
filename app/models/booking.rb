class Booking < ApplicationRecord
  belongs_to :bus
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  validate :no_reservation_overlap

  scope :overlapping, ->(period_start, period_end) do
    where "((start_date <= ?) and (end_date >= ?))", period_end, period_start
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end

  def no_reservation_overlap
    if (Booking.overlapping(start_date, end_date).any?)
      errors.add(:end_date, 'it overlaps another reservation')
    end
  end
end
