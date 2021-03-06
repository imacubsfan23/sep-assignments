require_relative 'movie'

my_movie = Movie.new('Footloose')

Kevin_Bacon = Actor.new("Kevin Bacon")
Lori_Singer = Actor.new("Lori Singer")
John_Lithgow = Actor.new("John Lithgow")
Dianne_Wiest = Actor.new("Dianne Wiest")
Chris_Penn = Actor.new("Chris Penn")
Sarah_Jessica_Parker = Actor.new("Sarah Jessica Parker")
Zoe_Saldanas = Actor.new("Zoe Saldanas")
Helen_Hunt = Actor.new("Helen Hunt")
Matthew_Perry = Actor.new("Matthew Perry")
Jessie_Williams = Actor.new("Jessie Williams")
Justin_Baldoni = Actor.new("Justin Baldoni")
Sandra_Oh = Actor.new("Sandra Oh")
Chris_Pratt = Actor.new("Chris Pratt")
Bryan_Cranston = Actor.new("Bryan Cranston")
Gina_Rodriguez = Actor.new("Gina Rodriguez")
Matthew_McConaughey = Actor.new("Matthew McConaughey")
Jeff_Perry = Actor.new("Jeff Perry")
Viola_Davis = Actor.new("Viola Davis")
Kerry_Washington = Actor.new("Kerry Washington")
Aaron_Paul = Actor.new("Aaron Paul")
Harrison_Ford = Actor.new("Harrison Ford")
Woody_Harrelson = Actor.new("Woody Harrelson")

Kevin_Bacon.film_actor_hash[my_movie] = [Lori_Singer, John_Lithgow, Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker]

Kevin_Bacon.film_actor_hash['A'] = [Zoe_Saldanas, Helen_Hunt, Lori_Singer]
Lori_Singer.film_actor_hash['A'] = [Kevin_Bacon, Zoe_Saldanas, Helen_Hunt]
Zoe_Saldanas.film_actor_hash['A'] = [Kevin_Bacon, Lori_Singer, Helen_Hunt]
Helen_Hunt.film_actor_hash['A'] = [Kevin_Bacon, Zoe_Saldanas, Lori_Singer]

Kevin_Bacon.film_actor_hash['B'] = [Matthew_Perry, Jessie_Williams, Lori_Singer]
Lori_Singer.film_actor_hash['B'] = [Kevin_Bacon, Jessie_Williams, Matthew_Perry]
Matthew_Perry.film_actor_hash['B'] = [Kevin_Bacon, Lori_Singer, Jessie_Williams]
Jessie_Williams.film_actor_hash['B'] = [Kevin_Bacon, Lori_Singer, Matthew_Perry]

Matthew_Perry.film_actor_hash['D'] = [Chris_Pratt, Justin_Baldoni, Sandra_Oh]
Chris_Pratt.film_actor_hash['D'] = [Matthew_Perry, Justin_Baldoni, Sandra_Oh]
Justin_Baldoni.film_actor_hash['D'] = [Matthew_Perry, Chris_Pratt, Sandra_Oh]
Sandra_Oh.film_actor_hash['D'] = [Matthew_Perry, Chris_Pratt, Justin_Baldoni]

Sandra_Oh.film_actor_hash['E'] = [Gina_Rodriguez, Bryan_Cranston, Matthew_McConaughey]
Gina_Rodriguez.film_actor_hash['E'] = [Sandra_Oh, Bryan_Cranston, Matthew_McConaughey]
Bryan_Cranston.film_actor_hash['E'] = [Sandra_Oh, Gina_Rodriguez, Matthew_McConaughey]
Matthew_McConaughey.film_actor_hash['E'] = [Sandra_Oh, Gina_Rodriguez, Bryan_Cranston]

Matthew_McConaughey.film_actor_hash['F'] = [Viola_Davis, Jeff_Perry, Kerry_Washington]
Viola_Davis.film_actor_hash['F'] = [Matthew_McConaughey, Jeff_Perry, Kerry_Washington]
Jeff_Perry.film_actor_hash['F'] = [Matthew_McConaughey, Viola_Davis, Kerry_Washington]
Kerry_Washington.film_actor_hash['F'] = [Matthew_McConaughey, Viola_Davis, Jeff_Perry]

Kerry_Washington.film_actor_hash['G'] = [Harrison_Ford, Woody_Harrelson, Aaron_Paul]
Harrison_Ford.film_actor_hash['G'] = [Kerry_Washington, Woody_Harrelson, Aaron_Paul]
Woody_Harrelson.film_actor_hash['G'] = [Kerry_Washington, Harrison_Ford, Aaron_Paul]
Aaron_Paul.film_actor_hash['G'] = [Kerry_Washington, Harrison_Ford, Woody_Harrelson]


describe "Graph Search" do
    it "returns Zoe Saldanas path" do
        var = my_movie.find_kevin_bacon(Zoe_Saldanas)
        expect(var.length).to eq 1
        expect(var).to eq ["A"]
    end
    
    it "returns Harrison Ford path" do
        var2 = my_movie.find_kevin_bacon(Harrison_Ford)
        expect(var2.length).to eq 5
        expect(var2).to eq ["G", "F", "E", "D", "B"]
    end
    
    it "returns Sandra Oh path" do
        var3 = my_movie.find_kevin_bacon(Sandra_Oh)
        expect(var3.length).to eq 3
        expect(var3).to eq ["D", "B", "E"]
    end
    
    it "returns Matthew Perry path" do
        var4 = my_movie.find_kevin_bacon(Matthew_Perry)
        expect(var4.length).to eq 1
        expect(var4).to eq ["B"]
    end
end