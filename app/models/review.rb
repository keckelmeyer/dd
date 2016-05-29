class Review < ActiveRecord::Base
  before_save :make_uppercase
  VALID_PLATE_REGEX = /([A-Z0-9]+)/
  validates :state, presence: true, length: { is: 2 }
  validates :plate, presence: true, length: { in: 1..7}, format: { with: VALID_PLATE_REGEX }
  validates :category, presence: true
  validates :stars, presence: true
  def make_uppercase
    self.plate.upcase!
  end

end

=begin

class Average <
before_

=end
