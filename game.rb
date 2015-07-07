require 'colored'
require 'pry'

require_relative 'hero'
require_relative 'monster'
require_relative 'party'
require_relative 'shop'

class Game 
  attr_reader :heroes, :shop
STOCK_HEROES = [atremis = Hero.new({
  name: "Artemis",
  hp: 200,
  weapon: Weapon.new({
    name: "longbow",
    damage: 6,
    price: 25
  })
}),

huxley = Hero.new({
  name: "Huxley",
  hp: 150,
  weapon: Weapon.new({
    name: "bludgeon",
    damage: 9,
    price: 75
  })
}),

barnes = Hero.new({
  name: "Barnes",
  hp: 300,
  weapon: Weapon.new({
    name: "dagger",
    damage: 3,
    price: 10
  })
}),

deblin = Hero.new({
  name: "Deblin",
  hp: 120,
  weapon: Weapon.new({
    name: "claymore",
    damage: 10,
    price: 100
  })
})]
    
  STOCK_MONSTERS = [goblin = Monster.new({
  name: "Goblin, father of 7",
  hp: 15,
  weapon: Weapon.new({
    name: "his wife's rusty last kitchen knife",
    damage: 1,
    price: 1
  }),
  xp: 2,
  gold: 1
}),

boobus = Monster.new({
  name: "boobus, IT'S GOOD FOR YOU",
  hp: 50,
  weapon: Weapon.new({
    name: "groovy pipe",
    damage: 3,
    price: 30
  }),
  xp: 4,
  gold: 2
}),

luber = Monster.new({
  name: "Luber, DEWD OF LEWD",
  hp: 20,
  weapon: Weapon.new({
    name: "gubber",
    damage: 15,
    price: 200
  }),
  xp: 10,
  gold: 5
}),

chuckBuck = Monster.new({
  name: "GRANDMASTER OF THE JABBERWOCK: CHUCKBUCK",
  hp: 100,
  weapon: Weapon.new({
    name: "gubber",
    damage: 30,
    price: 200
  }),
  xp: 20,
  gold: 10
}),

chuckBuck2 = Monster.new({
  name: "CHUCKBUCK2: ELECTRIC BOOGALOO",
  hp: 150,
  weapon: Weapon.new({
    name: "gubber2",
    damage: 40,
    price: 200
  }),
  xp: 50,
  gold: 20
})] 
  def initialize
    @heroes = enlist_heroes
    @shop = Shop.new
    @forest = Forest.new
    end
end

  def enlist_heroes
    Game::STOCK_HEROES.each_with_index do |hero, index|
    puts "#{index + 1} #{hero.name}, HP #{hero.max_hp}, WEAPON #{hero.weapon}, WEAPON DAMAGE #{hero.weapon.damage}"
  end
    @heroes = HeroParty.new
    puts "Choose a hero by number"
    choice1 = gets.chomp.to_i
    puts "Choose another hero"
    choice2 = gets.chomp.to_i
    result1 = Game::STOCK_HEROES[choice1 - 1]
    result2 = Game::STOCK_HEROES[choice2 - 1]
    @heroes.enroll(result1)
    @heroes.enroll(result2)
    return  @heroes
    # Display choices for heroes
    # Prompt (gets) the user for choices e.g. 2, 6
    # Create a part with those heroes in it and return it
  end

  def enter_forest
  monsters = MonsterParty.new
    monsters.enroll(Game::STOCK_MONSTERS.sample)
    monsters.enroll(Game::STOCK_MONSTERS.sample)
  current_fighters = [monsters, @heroes]
  @heroes.attack(monsters)
   monsters.attack(@heroes)
   attacker = current_fighters.shift
   attackee = current_fighters.shift
  
   while attackee.is_alive?
     attacker.attack(attackee)
  
     puts "#{attacker} attacks #{attackee} with his #{attacker.weapon} for #{attacker.weapon.damage}.  #{attackee} now has #{attackee.current_hp} HP left."
  
     attacker, attackee = attackee, attacker unless attackee.is_dead?
   end
  
   puts "#{attackee} is now dead..."
  end

  def enter_shop
    @shop.enter(@heroes)
  end

  def town_message
    puts "Your heroes are ready for action,
    should they...
    1. Enter the forest?
    2. Go shopping for wares?"
    get_location
  end

  def get_location
    resp = gets.chomp

    if resp == "1"
      enter_forest
      return :forest

    else
      enter_shop
      return :shop
    end
  end

  def play
    while @heroes.any?
    town_message
    case get_location
    when :forest
      enter_forest
    when :shop
      enter_shop
    end
  end
end

Pry.start(binding)
