<<<<<<< HEAD
class RecFinder::Scraper
  def self.get_page(index)
    Nokogiri::HTML(open(index))
  end
  def self.get_detail(url)
    Nokogiri::HTML(open(url))
  end
  def self.scrape_index(index)
    parks = []
    html_block = self.get_page(index).css("tr.maplink")
=======
require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  def get_page
    Nokogiri::HTML(open("http://www.thprd.org/facilities/directory/"))
  end
  def get_detail(url)
    Nokogiri::HTML(open(url))
  end
  def scrape_index
    parks = []
    html_block = self.get_page.css("tr.maplink")
>>>>>>> f63aec7130ede30dc599820339af9189fa915b8c
    html_block.each {|p|
      parks << {
      :url => p.css("a.linkurl")[0].attribute("href").value,
      :name => p.css("a.linkurl")[0].text
      }
    }
    parks
  end
<<<<<<< HEAD
  def self.scrape_detail(url)
    detail = self.get_detail(url)
    data = {
    :phone => detail.css("p.phone_numbers a")[0].text.gsub("Phone ",""),
    :address => detail.css("p.mainaddress").text.gsub("/\n/",",").split.join(" "),
    :description => detail.css("div.location--main_description").text.split.join(" ")
    }
    if detail.css("div.alert_banner").count == 1
      #puts detail.css("div.alert_banner").text
      data[:alert] = detail.css("div.alert_banner").text.split.join(" ")
    end
    data
  end

end
=======
  def scrape_detail(url)
    detail = self.get_detail(url)
    {
    :phone => detail.css("p.phone_numbers a")[0].text.gsub("Phone ","")
    :address => detail.css("p.mainaddress").text.gsub("<br>",",").split.join(" ")
    :description => detail.css("div.location--main_description").text.split.join(" ")
    }
  end

end

test = Scraper.new
puts test.scrape_index
test.scrape_detail("http://www.thprd.org/facilities/nature/tualatin-hills-nature-center")
>>>>>>> f63aec7130ede30dc599820339af9189fa915b8c
