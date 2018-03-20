require_relative 'city'

def distance_between(loc1, loc2)
   Math.hypot(loc2.x - loc1.x, loc2.y - loc1.y)
end

def nearest_possible_neighbor(graph_of_cities, current_city)
  route = [current_city.name]
  while graph_of_cities[0]
    next_city = graph_of_cities[0]
    graph_of_cities.each { |option| next_city = option if distance_between(current_city, next_city) > distance_between(current_city, option) }
    current_city = next_city
    graph_of_cities.delete(next_city)
    route.push(current_city.name)
  end
  route
end

home = City.new("Chicago", 0, 0)
city2 = City.new("New York", 15, 10)
city3 = City.new("Seattle", 22, 11)
city4 = City.new("Los Angeles", 22, 3)
city5 = City.new("Cleveland", 8, 2)
city6 = City.new("Houston", 8, 20)
city7 = City.new("Atlanta", 0, 10)

city_graph = [city2, city3, city4, city5, city6, city7]

trip_route = nearest_possible_neighbor(city_graph, home)
puts trip_route