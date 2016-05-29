class Plate < ActiveRecord::Base
  before_save :make_uppercase
  before_save :combine
  before_action :averages
  VALID_PLATE_REGEX = /([A-Z0-9]+)/
  validates :state, presence: true, length: { is: 2 }
  validates :plate, presence: true, length: { in: 1..7}, format: { with: VALID_PLATE_REGEX }

  def combine
    self.full! = self.state + self.state
  end
  def make_uppercase
    self.plate.upcase!
  end
  def averages(:full)
    self.turning = Review.average(:stars).where("category = Turning","full = #{:full}" )
    self.merging = Review.average(:stars).where("category = Turning","full = #{:full}" )
    self.parking = Review.average(:stars).where("category = Turning","full = #{:full}" )
    self.speed = Review.average(:stars).where("category = Turning","full = #{:full}" )
    self.general = Review.average(:stars).where("category = Turning","full = #{:full}" )
    self.overall = Review.average(:stars).where("category = Turning","full = #{:full}" )
  end


end
