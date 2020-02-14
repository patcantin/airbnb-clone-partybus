class Booking < ApplicationRecord
  belongs_to :bus
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.date(:end_date, "must be after the start date.")
    end
  end
end
