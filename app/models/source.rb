class Source < ActiveRecord::Base
  has_many :parts, :dependent => :destroy

  def headline
    file = info.split('</td>')[1].reverse.truncate(60).reverse
    word = info.split('</td>')[3].split('"')[1]
    return "#{word} from #{file}"
  end
end
