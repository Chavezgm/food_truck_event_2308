class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name 
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  
  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.inventory.key?(item)
    end
  end

  def overstock_items
    overstocked_items = []

    item_counts = Hash.new(0)

    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        item_counts[item] += 1
      end 
    end
  end

  def sorted_item_list
    unique_names = Set.new

    @food_trucks.each do |food_truck|
      food_truck.inventory.keys.each do |item|
        unique_names.add(item.name)
      end
    end
    unique_names.to_a.sort
  end

end