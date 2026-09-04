CREATE CONSTRAINT person_id_unique IF NOT EXISTS
FOR (p:Person)
REQUIRE p.id IS UNIQUE;

CREATE CONSTRAINT movie_id_unique IF NOT EXISTS
FOR (m:Movie)
REQUIRE m.id IS UNIQUE;

CREATE CONSTRAINT character_id_unique IF NOT EXISTS
FOR (c:Character)
REQUIRE c.id IS UNIQUE;

CREATE CONSTRAINT company_id_unique IF NOT EXISTS
FOR (c:Company)
REQUIRE c.id IS UNIQUE;

CREATE CONSTRAINT episode_id_unique IF NOT EXISTS
FOR (e:Episode)
REQUIRE e.id IS UNIQUE;

CREATE CONSTRAINT genre_id_unique IF NOT EXISTS
FOR (g:Genre)
REQUIRE g.id IS UNIQUE;

CREATE CONSTRAINT season_id_unique IF NOT EXISTS
FOR (s:Season)
REQUIRE s.id IS UNIQUE;

CREATE CONSTRAINT series_id_unique IF NOT EXISTS
FOR (s:Series)
REQUIRE s.id IS UNIQUE;

CREATE CONSTRAINT casting_id_unique IF NOT EXISTS
FOR (c:Casting)
REQUIRE c.id IS UNIQUE;
