<<<<<<< HEAD
class RecFinder::Rec
  attr_accessor :name, :url, :phone, :address, :description, :alert
=======
class Rec
  attr_accessor :name, :url, :phone, :address, :description
>>>>>>> f63aec7130ede30dc599820339af9189fa915b8c
  @@all = []
  def initialize(rec_data)
    rec_data.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end
  def self.create_from_data(data)
    data.each{|d|
<<<<<<< HEAD
      self.new(d)
=======
      Rec.new(d)
>>>>>>> f63aec7130ede30dc599820339af9189fa915b8c
    }
  end
  def add_detail(detail_data)
    detail_data.each {|key, value| self.send(("#{key}="), value)}
<<<<<<< HEAD
    self.details_updated = true
=======
>>>>>>> f63aec7130ede30dc599820339af9189fa915b8c
  end
  def self.all
    @@all
  end
<<<<<<< HEAD
  def self.sayhello
    puts "hello"
  end
=======
>>>>>>> f63aec7130ede30dc599820339af9189fa915b8c
end
