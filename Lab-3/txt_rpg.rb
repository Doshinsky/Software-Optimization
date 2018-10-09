class Hero
  def initialize()
    puts 'Hello there! How can I name you, stranger?'
    name = gets.chomp
    hp = 100
    mp = 100
    st = 50
    san = 0
    cash = 20
    heroMarine = Struct.new(:name, :hp, :mp, :st, :san, :cash)
    puts Processing.handler(heroMarine)
  end
end

class Events
  def goToWork(heroMarine)
    heroMarine.mp = heroMarine.mp - 30
    heroMarine.san = heroMarine.san - 5
    heroMarine.cash = heroMarine.cash + 100
    heroMarine.st = heroMarine.st + 70
  end

  def chillingOutdoor(heroMarine)
    heroMarine.hp = heroMarine.hp + 5
    heroMarine.mp = heroMarine.mp - 10
    heroMarine.san = heroMarine.san + 1
    heroMarine.st = heroMarine.st + 10
  end

  def chillingAtHome(heroMarine)
    heroMarine.hp = heroMarine.hp + 2
    heroMarine.mp = heroMarine.mp + 30
    heroMarine.san = heroMarine.san + 1
    heroMarine.cash = heroMarine.cash - 20
    heroMarine.st = heroMarine.st + 10
  end

  def goToBar(heroMarine)
    heroMarine.hp = heroMarine.hp - 10
    heroMarine.mp = heroMarine.mp + 60
    heroMarine.san = heroMarine.san + 5
    heroMarine.cash = heroMarine.cash - 100
    heroMarine.st = heroMarine.st + 40
  end

  def getDrunk(heroMarine)
    heroMarine.hp = heroMarine.hp - 80
    heroMarine.mp = heroMarine.mp + 90
    heroMarine.san = heroMarine.san + 5
    heroMarine.cash = heroMarine.cash - 150
    heroMarine.st = heroMarine.st + 80
  end

  def publicSinging(heroMarine)
    if heroMarine.mp > 40 && heroMarine.mp < 70
      heroMarine.cash = heroMarine.cash + 50
    end
    heroMarine.mp = heroMarine.mp - 10
    heroMarine.san = heroMarine.san + 1
    heroMarine.cash = heroMarine.cash + 10
    heroMarine.st = heroMarine.st + 70
  end

  def goToSleep(heroMarine)
    if heroMarine.mp < 30
      heroMarine.hp = heroMarine.hp + 90
    end
    if heroMarine.mp > 70
      heroMarine.san = heroMarine.san - 3
    end
    heroMarine.mp = heroMarine.mp - 50
    heroMarine.st = heroMarine.st - 70
  end
end

class Processing
  def handler(heroMarine, choice)
    if choice.downcase == 'gtw'
      if heroMarine.hp > 0 && heroMarine.mp >= 30 && heroMarine.san > -5 && heroMarine.st < 30
        goToWork(heroMarine)
      end
    elsif choice.downcase == 'cod'
      if heroMarine.hp > 0 && heroMarine.mp >= 10 && heroMarine.st < 90
        chillingOutdoor(heroMarine)
      end
    elsif choice.downcase == 'cah'
      if heroMarine.hp > 0 && heroMarine.cash > 20 && heroMarine.st < 90
        chillingAtHome(heroMarine)
      end
    elsif choice.downcase == 'gtb'
      if heroMarine.hp > 10 && heroMarine.cash > 100 && heroMarine.st < 60
        goToBar(heroMarine)
      end
    elsif choice.downcase == 'gd'
      if heroMarine.hp > 80 && heroMarine.cash > 150 && heroMarine.st < 20
        getDrunk(heroMarine)
      end
    elsif choice.downcase == 'ps'
      if heroMarine.hp > 0 && heroMarine.mp >= 10 && heroMarine.st < 30
        publicSinging(heroMarine)
      end
    elsif choice.downcase == 'gts'
      if heroMarine.hp > 0 && heroMarine.mp >= 50 && heroMarine.san > -5 && heroMarine.st < 30
        goToSleep(heroMarine)
      end
    end
  end

  def scene(heroMarine)
    begin
      puts 'So, what\'s next?'
      puts '>'
      choice = gets.chomp
      puts handler(heroMarine, choice)
    end while heroMarine.hp > 0 && choice.downcase != 'save' && heroMarine.san > -10
  end
end

stream = Hero.new
