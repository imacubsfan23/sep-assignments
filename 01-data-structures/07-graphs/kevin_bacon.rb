require_relative 'node'

class KevinBacon
    def find_kevin_bacon(actor)
        movies = []
        actor.film_actor_hash.each do |title, actors|
            actors.each do |a|
                a == "kevin_bacon" ? movies.push(title) : find_kevin_bacon(a)
            end
        end
        puts (movies.length < 7 && !movies.empty?) ? "Movies: [#{movies.all}]" : "Not connected through these movies by less than 7"
    end
end