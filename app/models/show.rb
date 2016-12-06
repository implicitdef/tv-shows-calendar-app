class Show < ApplicationRecord
  has_many :seasons, dependent: :destroy
  has_and_belongs_to_many :users, :uniq => true
  validates :name, presence: true, allow_blank: false
  validates :id, presence: true, numericality: { only_integer: true }


  def as_json(options={})
    super(:except => [:created_at, :updated_at])
  end
end
