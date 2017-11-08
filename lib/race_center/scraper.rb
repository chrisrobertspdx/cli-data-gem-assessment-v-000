require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  def get_page
    #Nokogiri::HTML(open("http://www.racecenter.com/race-calendar/"))
    Nokogiri::HTML(open("http://www.gravelcyclist.com/calendar/"))
  end
  def scrape_races
    #self.get_page.css("table#calendarlist tr.r0,table#calendarlist tr.r1").each{|tr|
      #tr.css("td").each_widthindex {|td,index|
    events = self.get_page.css("div.ai1ec-event")
    puts events.count
    events.each {|e|
      title = e.css("div.ai1ec-event-inner div.ai1ec-event-title a")
      puts title.text.to_s.split.join(" ")
      puts title.attribute("href").value
      puts e.css("div.ai1ec-event-inner div.ai1ec-event-meta span.ai1ec-event-time").text.split.join(" ")
    }
  end
end

test = Scraper.new
test.scrape_races
