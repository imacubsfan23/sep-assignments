require_relative 'actor'

class Movie
  
  def initialize(name)
    @name = name
  end

  def find_kevin_bacon(movies=[], count=0, actor)
    if count < 7
      actor.film_actor_hash.each do |title, actors|
        actors.each do |a|
          if a.name == "Kevin Bacon"
             movies.push(title)
             break
          else
            if movies.length > 6
              break
            else
              temp = find_kevin_bacon(movies, count+1, a)
              break if !temp
              movies.push(title)
              movies += temp
            end
          end
        end
        break
      end
    end
    movies.uniq.length > 6 ? [] : movies.uniq
  end
end
