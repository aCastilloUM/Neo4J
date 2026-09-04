
LOAD CSV WITH HEADERS FROM 'file:///csv/seasons.csv' AS row
MATCH (s:Series {id: row.seriesId})
MATCH (se:Season {id: row.id})
MERGE (s)-[r:HAS_SEASON]->(se);

LOAD CSV WITH HEADERS FROM 'file:///csv/episode_cast.csv' AS row
MATCH (p:Person {id: row.personId})
MATCH (e:Episode {id: row.episodeId})
MATCH (ch:Character {id: row.characterId})
MERGE (casting:Casting {
    id: row.episodeId + '-' + row.personId + '-' + row.characterId + '-' + row.roleName
})
SET casting.roleName = row.roleName,
    casting.sourceUrl = row.sourceUrl,
    casting.workType = 'Episode'
MERGE (p)-[:HAS_CASTING]->(casting)
MERGE (casting)-[:IN_EPISODE]->(e)
MERGE (casting)-[:PLAYS]->(ch);

LOAD CSV WITH HEADERS FROM 'file:///csv/movie_cast.csv' AS row
MATCH (p:Person {id: row.personId})
MATCH (m:Movie {id: row.movieId})
MATCH (ch:Character {id: row.characterId})
MERGE (casting:Casting {
    id: row.movieId + '-' + row.personId + '-' + row.characterId + '-' + row.roleName
})
SET casting.roleName = row.roleName,
    casting.sourceUrl = row.sourceUrl,
    casting.workType = 'Movie'
MERGE (p)-[:HAS_CASTING]->(casting)
MERGE (casting)-[:IN_MOVIE]->(m)
MERGE (casting)-[:PLAYS]->(ch);

LOAD CSV WITH HEADERS FROM 'file:///csv/episode_directors.csv' AS row
MATCH (p:Person {id: row.personId})
MATCH (e:Episode {id: row.episodeId})
MERGE (p)-[r:DIRECTED]->(e)
SET r.sourceUrl = row.sourceUrl;

LOAD CSV WITH HEADERS FROM 'file:///csv/episode_writers.csv' AS row
MATCH (p:Person {id: row.personId})
MATCH (e:Episode {id: row.episodeId})
MERGE (p)-[r:WROTE]->(e)
SET r.sourceUrl = row.sourceUrl;

LOAD CSV WITH HEADERS FROM 'file:///csv/movie_genres.csv' AS row
MATCH (m:Movie {id: row.movieId})
MATCH (g:Genre {id: row.genreId})
MERGE (m)-[r:HAS_GENRE]->(g)
SET r.sourceUrl = row.sourceUrl;

LOAD CSV WITH HEADERS FROM 'file:///csv/movie_producers.csv' AS row
MATCH (p:Person {id: row.personId})
MATCH (m:Movie {id: row.movieId})
MERGE (p)-[r:PRODUCED_MOVIE]->(m)
SET r.sourceUrl = row.sourceUrl;

LOAD CSV WITH HEADERS FROM 'file:///csv/movie_writers.csv' AS row
MATCH (p:Person {id: row.personId})
MATCH (m:Movie {id: row.movieId})
MERGE (p)-[r:WROTE_MOVIE]->(m)
SET r.sourceUrl = row.sourceUrl;

LOAD CSV WITH HEADERS FROM 'file:///csv/movie_directors.csv' AS row
MATCH (p:Person {id: row.personId})
MATCH (m:Movie {id: row.movieId})
MERGE (p)-[r:DIRECTED_MOVIE]->(m)
SET r.sourceUrl = row.sourceUrl;

LOAD CSV WITH HEADERS FROM 'file:///csv/series_creators.csv' AS row
MATCH (p:Person {id: row.personId})
MATCH (s:Series {id: row.seriesId})
MERGE (p)-[r:CREATED_SERIES]->(s)
SET r.sourceUrl = row.sourceUrl;

LOAD CSV WITH HEADERS FROM 'file:///csv/series_genres.csv' AS row
MATCH (s:Series {id: row.seriesId})
MATCH (g:Genre {id: row.genreId})
MERGE (s)-[r:HAS_GENRE]->(g)
SET r.sourceUrl = row.sourceUrl;

LOAD CSV WITH HEADERS FROM 'file:///csv/episodes.csv' AS row
MATCH (se:Season {id: row.seasonId})
MATCH (e:Episode {id: row.id})
MERGE (e)-[r:BELONGS_TO_SEASON]->(se)
SET r.seasonNumber = toInteger(row.seasonNumber),
    r.episodeNumber = toInteger(row.episodeNumber)
WITH e, se, row
MATCH (s:Series {id: row.seriesId})
MERGE (e)-[r2:BELONGS_TO_SERIES]->(s);

LOAD CSV WITH HEADERS FROM 'file:///csv/production_companies.csv' AS row
MATCH (c:Company {id: row.companyId})
CALL (c, row) {
    WITH c, row
    WITH c, row WHERE row.workType = 'Movie'
    MATCH (m:Movie {id: row.workId})
    MERGE (c)-[r:PRODUCED_MOVIE]->(m)
    SET r.workType = row.workType,
        r.sourceUrl = row.sourceUrl
}
CALL (c, row) {
    WITH c, row
    WITH c, row WHERE row.workType = 'Series'
    MATCH (s:Series {id: row.workId})
    MERGE (c)-[r:PRODUCED_SERIES]->(s)
    SET r.workType = row.workType,
        r.sourceUrl = row.sourceUrl
};