class Show < ApplicationRecord
  has_many :seasons, dependent: :destroy
  has_and_belongs_to_many :users, :uniq => true
  validates :name, presence: true, allow_blank: false
  validates :id, presence: true, numericality: { only_integer: true }


  def as_json(options={})
    super(:except => [:created_at, :updated_at])
  end

  DEFAULT_SHOWS_IDS = [
    1399, # Game of Thrones
    1402, # Walking dead
    63247, # Westworld
    66732, # Stranger things
    60059, # Better call saul
    1396, # Breaking bad
    1424, # Orange is the new black
    1412, # Arrow
    2190, # South park
    61733 # Empire
  ].freeze
end
