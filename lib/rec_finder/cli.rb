class RecFinder::CLI
  attr_accessor :rec
  BASE_URL = 'http://www.thprd.org'

  def run
    make_recs
    #add_attributes_to_recs
    display_recs
  end

  def make_recs
    RecFinder::Facility.create_from_data(RecFinder::Scraper.scrape_index(BASE_URL+"/facilities/directory/"))
  end

  #think about where the scrape should happen
  def display_recs
    RecFinder::Facility.all.each_with_index{|r,index|
      puts "#{index+1}. #{r.name}"
    }
    print "Which recreation facility would you like more informations about? "
    index = gets.strip.to_i
    detail = RecFinder::Rec.all[index-1]
    if detail.description == nil
      detail.add_detail(RecFinder::Scraper.scrape_detail(BASE_URL+detail.url))
    end
    puts ""
    puts detail.name.upcase
    puts "-----------------------"
    puts detail.phone
    puts detail.address
    puts "-----------------------"
    if detail.alert != nil
      puts detail.alert
      puts
    end
    puts detail.description
  end

end
