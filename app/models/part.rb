class Part < ActiveRecord::Base
  belongs_to :source
  has_many :tags
end
