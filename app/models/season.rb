class Season < ApplicationRecord
  belongs_to :show
  validates :number, presence: true, numericality: { only_integer: true }
  validates :number, uniqueness: { scope: :show, message: "should be unique per show" }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_before_end_date


  def as_json(options={})
    super(:except => [:created_at, :updated_at, :show_id])
  end

  private
  def start_date_before_end_date
    if !start_date.nil? && !end_date.nil? && start_date > end_date
      errors.add(:start_date_before_end_date, "Start date must be before the end date")
    end
  end



end
