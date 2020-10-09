require "pry"
require_relative "./cat.rb"
require_relative "./dog.rb"

class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.map{|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.map{|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.dogs.map{|dog| dog.mood = "nervous"
                        dog.owner = nil}
    self.cats.map{|cat| cat.mood = "nervous"
                        cat.owner = nil}   
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    all.count
  end

  def self.reset_all
    all.clear
  end
end
