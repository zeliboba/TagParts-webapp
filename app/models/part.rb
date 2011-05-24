require 'nokogiri'

class Part < ActiveRecord::Base
  belongs_to :source
  has_and_belongs_to_many :tags
  validates_presence_of :content

  def headline
    ncontext = 2
    doc = Nokogiri::HTML(content).at('table')
    # this might help to reduce the width of the table
    #doc.set_attribute('width', '75%')
    # get tr and td of the line with the word
    trtd = doc.at('//font[@color="#0000ff" or @color="#0000FF"]').css_path.gsub(/\D/,' ').split()
    tr = trtd[0].to_i
    td = trtd[1].to_i
    # remove row except the line and context
    doc.search("tr:gt(#{tr + ncontext})").remove
    doc.search("//tr[position() < (#{tr - ncontext})]").remove
    # remove some columns
    doc.search("td:eq(4)").remove
    doc.search("//td[position() < 3]").remove
    return "#{doc.to_html}"
  end

end
