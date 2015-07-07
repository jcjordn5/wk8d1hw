require_relative 'entity'
class Hero < Entity
  def initialize(opts = {})
    @xp =  0

    opts[:default_weapon] = Weapon.new({
      name: "fists",
      damage: 1,
      price: 0
    })

    super
     def to_s
    "#{@name}"
  end
  end
end

# my_weapon = Weapon.new(name: "longsword", damage: 3)
# my_hero = Hero.new(name: "Artemis", hp: 20, weapon: my_weapon)
