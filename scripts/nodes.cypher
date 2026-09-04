LOAD CSV WITH HEADERS FROM 'file:///csv/people.csv' AS row
MERGE (p:Person {id: row.id})
SET p += {
    name: row.name,
    primaryProfession: row.primaryProfession,
    birthYear: toInteger(row.birthYear),
    wikidataId: row.wikidataId,
    tvmazeId: row.tvmazeId,
    sourceUrl: row.sourceUrl
};

LOAD CSV WITH HEADERS FROM 'file:///csv/movies.csv' AS row
MERGE (m:Movie {id: row.id})
SET m += {
    title: row.title,
    year: toInteger(row.year),
    runtime: toInteger(row.runtime),
    rating: toFloat(row.rating),
    ratingSource: row.ratingSource,
    description: row.description,
    wikidataId: row.wikidataId,
    imdbId: row.imdbId,
    sourceUrl: row.sourceUrl
};

LOAD CSV WITH HEADERS FROM 'file:///csv/characters.csv' AS row
MERGE (ch:Character {id: row.id})
SET ch += {
    name: row.name,
    description: row.description,
    wikidataId: row.wikidataId,
    tvmazeId: row.tvmazeId,
    sourceUrl: row.sourceUrl
};

LOAD CSV WITH HEADERS FROM 'file:///csv/companies.csv' AS row
MERGE (c:Company {id: row.id})
SET c += {
    name: row.name,
    country: row.country,
    foundedYear: toInteger(row.foundedYear),
    wikidataId: row.wikidataId,
    tvmazeId: row.tvmazeId,
    sourceUrl: row.sourceUrl
};

LOAD CSV WITH HEADERS FROM 'file:///csv/episodes.csv' AS row
MERGE (e:Episode {id: row.id})
SET e += {
    seriesId: row.seriesId,
    seasonId: row.seasonId,
    title: row.title,
    seasonNumber: toInteger(row.seasonNumber),
    episodeNumber: toInteger(row.episodeNumber),
    year: toInteger(row.year),
    runtime: toInteger(row.runtime),
    rating: toFloat(row.rating),
    ratingSource: row.ratingSource,
    description: row.description,
    tvmazeId: row.tvmazeId,
    sourceUrl: row.sourceUrl
};

LOAD CSV WITH HEADERS FROM 'file:///csv/genres.csv' AS row
MERGE (g:Genre {id: row.id})
SET g += {
    name: row.name,
    wikidataId: row.wikidataId,
    sourceUrl: row.sourceUrl
};

LOAD CSV WITH HEADERS FROM 'file:///csv/seasons.csv' AS row
MERGE (se:Season {id: row.id})
SET se += {
    seriesId: row.seriesId,
    seasonNumber: toInteger(row.seasonNumber),
    year: toInteger(row.year),
    tvmazeId: row.tvmazeId,
    sourceUrl: row.sourceUrl
};

LOAD CSV WITH HEADERS FROM 'file:///csv/series.csv' AS row
MERGE (s:Series {id: row.id})
SET s += {
    title: row.title,
    startYear: toInteger(row.startYear),
    rating: toFloat(row.rating),
    ratingSource: row.ratingSource,
    description: row.description,
    tvmazeId: row.tvmazeId,
    sourceUrl: row.sourceUrl
};
