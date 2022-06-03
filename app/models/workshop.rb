class Workshop < ApplicationRecord
  validates :name, :description, presence: true
  validates :start_date, :end_date, :start_time, :end_time, presence: true
  validates :total_sits, :registration_fee, presence: true, numericality: true
  validates :end_date, comparison: { greater_than: :start_date, messaage: 'can not be before start date'}
end
