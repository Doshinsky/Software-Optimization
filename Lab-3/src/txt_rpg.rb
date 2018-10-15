require 'yaml'

class Events
  attr_accessor :description, :buff

  def initialize(data)
    self.description = data['name']
    data.delete 'name'
    self.buff = data
  end

  def apply(hero)
    puts @description
    @buff.each do |stat, value|
      hero.send(stat + '=', value)
    end
  end
end

class Processing
  attr_reader :events, :heroMarine

  def initialize
    puts 'Loading...'
    puts 'Loading events...'
    puts 'Loading... Again'
    events_from_file = YAML.load_file '../cfg/event.yml'
    @events = Array.new
    events_from_file.each do |line|
      event = Processing.new line
      @events.push event
    end

    puts 'Born one more freak Space Marine...'
    @heroMarine = heroMarine.new
  end

  def event_list
    list = Array.new
    self.events.each do |event|
      list.push event.description
    end
    list
  end

  def ggwp(number)
      self.events.at(number).apply(@heroMarine)
  end
end

class Hero
  attr_accessor :HP, :MP, :ST, :San, :Cash

  def initialize
    stats_from_file = YAML.load_file '../cfg/stats.yml'
    @stats = Array.new
    stats_from_file.each do |line|
      stats = Event.new line
      @stats.push stats
    end
  end

  def mp=(value)
    @mp = self.mp + value
    if (mp < 0)
      @mp = 0
    end
    if (mp > 100)
      @hp = self.hp - (100 - self.mp)
      @mp = 100
    end
  end

  def gg?
    if (self.hp <= 0 || self.san <= -10)
      return true
    else
      return false
    end
  end
end

Processing.new
