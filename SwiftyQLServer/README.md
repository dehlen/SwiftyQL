# SwiftyQL-Server
GraphQL Backend for SwiftyQL written with nodejs.


## Installation
You need to install all dependencies once using `npm install`.

## Start
To start the server you simply run `npm start`. It is hosted on port `8000`.

## Available methods
**createObject: Mutation**
Creates a new object with the given name and returns the object with its name and its id
```
mutation createObjectWithName {createObject(name: "test"){name,id}}
```

**allObjects: Query**
Returns all objects
```
query allObjects {objects{name,id}}
```

**objectWithId: Query**
Returns a specific object with a given id
```
query objectWithId {object(id: "1"){name,id}}
```


