class Part < ActiveRecord::Base
  belongs_to :source
  has_and_belongs_to_many :tags
end
