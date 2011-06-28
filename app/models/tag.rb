class Tag < ActiveRecord::Base
  has_and_belongs_to_many :parts
  validates_uniqueness_of :word
  validates_length_of :word, :minimum => 2, :too_short => "please enter at least %{count} character"
  default_scope :order => "word"
  belongs_to :category

  def to_label
    "#{word}"
  end

end
