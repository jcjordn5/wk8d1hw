class Party
  def initialize
    @alive = []
    @dead = []
  end

  def enroll(member)
    @alive << member
  end

  def any?
    @alive.any?
    # should return true if the party has surviving members
    return true
  end

  def none?
    !any?
  end
  def cleanup!
    the_dead = @alive.select {|memeber| member.is_dead?}
    @alive -= the_dead
    @dead += the_dead
  end
      def to_s
    "#{@alive}"
  end
end

class HeroParty < Party
  attr_reader :gold
  def initialize
    @gold = 0
    super
 
  end

  def attack(opposing_party)
    # sending message to user, asking which monster to attack
    puts opposing_party
    puts "Which monster do you want to attack"
    target = gets.chomp
  end
end

class MonsterParty < Party
  def attack(opposing_party)
    # randomly choose a member of the opposing_party and attack it
    target = opposing_party.sample

  end

end
