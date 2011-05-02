class Source < ActiveRecord::Base
  has_many :parts, :dependent => :destroy
end
