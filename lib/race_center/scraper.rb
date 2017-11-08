require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  def get_page
    Nokogiri::HTML(open("http://www.racecenter.com/race-calendar/"))
  end
  def scrape_races
    puts self.get_page.css("table#calendarlist")
  end
end

test = Scraper.new
test.scrape_races
