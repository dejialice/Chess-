# PHASE 2
def convert_to_int(str)
  begin
    num = Integer(str)
  rescue ArgumentError
    puts"No valid argument passed in"
  ensure
    num ||= nil
  end
  
  num
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
  def message
    "Thanks for the coffee. Try again!"
  end
end

class WrongFruitError < StandardError
  def message
    "Hey! I don't like that kind of fruit!"
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else 
    raise WrongFruitError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
    retry
  rescue WrongFruitError => e
    puts e.message
  end

end  

# PHASE 4
class YearsError < StandardError
  def message
    "But it's been less than 5 years!"
  end
end

class NoNameError < ArgumentError
  def message
  "Hey, when you make a new friend, write down their name first!"
  end
end

class PastimeError < ArgumentError
  def message
    "but what is your favorite pastime?? Finish creating your friend by typing their favorite pastime."
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
    retry
  rescue WrongFruitError => e
    puts e.message
  end

end  

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new("but you must have a name. Type a real name in please...") if name.empty?
    raise ArgumentError.new("If we are really best friends we would have known eachother for longer than 5 years...") if yrs_known.to_i < 5
    raise ArgumentError.new("You must have a favorite pastime") if fav_pastime.empty?
    
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


