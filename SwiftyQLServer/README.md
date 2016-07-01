# SwiftyQL-Server
GraphQL Backend for SwiftyQL written with nodejs.


## Installation
You need to install all dependencies once using `npm install`.

## Start
To start the server you simply run `npm start`. It is hosted on port `8000`.

## Available methods
**createMovie: Mutation**

Creates a new movie object with the given name and returns the movie with its name and its id
```
mutation createMovieWithName {createMovie(name: "test"){name,id}}
```
----
**allMovies: Query**

Returns all movies
```
query allMovies {movies{name,id}}
```
----
**movieWithId: Query**

Returns a specific movie with a given id
```
query moviewWithId {movie(id: "1"){name,id}}
```


