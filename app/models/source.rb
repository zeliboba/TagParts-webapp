require 'hpricot'

class Source < ActiveRecord::Base
  has_many :parts, :dependent => :destroy

  def headline
    doc = Hpricot(info)
    file = doc.search('//td')[1].inner_text.reverse.truncate(60).reverse
    word = doc.search('//td')[3].inner_text.scan(/\w\w+/).first # two letters at least
    return "#{word} from #{file}"
  end
end
