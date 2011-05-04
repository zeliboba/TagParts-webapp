class Tag < ActiveRecord::Base
  has_and_belongs_to_many :parts
  validates_uniqueness_of :word

  def to_label
    "#{word}"
  end

end
