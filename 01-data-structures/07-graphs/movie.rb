require_relative 'actor'

class Movie
  attr_accessor :visited

  def initialize(name)
    @name = name
    @visited = Array.new
  end

  def find_kevin_bacon(actor)
    movies = []
    @visited.push(actor)
    actor.film_actor_hash.each do |title, actors|
      actors.each do |a|
        movies.push(title) and return movies if a.name == "Kevin Bacon"
        if !@visited.include?(a)
          temp = find_kevin_bacon(a)
          next if !temp
          movies.push(title)
          movies += temp
        end
      end
    end
    puts "Bacon Number #{(movies.length < 7 && movies.length > 0) ? "= #{movies.length} Movies: #{movies}" : "> 6"}"
  end
end