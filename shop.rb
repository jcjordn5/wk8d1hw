require_relative 'weapon'
require_relative'game'

class Shop
  def initialize
  	@warez = create_warez
  end
  def display_warez
  	@warez.each_with_index do |item, index|
  		puts"#{index + 1}. #{item}, Damage #{item.damage}, Price #{item.price}"
  	end
  end

  def get_choice
  	print "What do you want?"
  	choice = gets.chomp.to_i - 1
  	until @warez[choice]
  		puts "HAHAHAHA!!! SUCKER!"
  		prtint "What do you want?"
  		choice = gets.chomp.to_i - 1
  	end
  	return warez[choice]
  end

  def wealthy?(party, item)
  	return party.gold >= price
  end
  def enter(party)
  	display_warez
  	item = get_choice
 	if wealthy?(party, item)
 		party.purchase(item)
 	else
 		puts "HAHAHAHA!!! YOUR'RE POOR. WE OUGHT TO LIGHT YOU ON FIRE LIKE ALL THE OTHER BUMS!!!"
 	end
  end

  private
  def crerate_warez
  	return [
  		Weapon.new({name:"mace", damage:20, price:100 }),
  		Weapon.new({name:"claymore", damage:50, price:500}),
  		Weapon.new({name:"excalibur", damage:999, price: 10000})
  	]
  end
end
