class Comment < ActiveRecord::Base
  belongs_to :movie

  validates_numericality_of :rating, less_than_or_equal_to: 100

  def self.descending
  	order(:created_at => :desc)
  end
end

