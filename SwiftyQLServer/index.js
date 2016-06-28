import express from 'express'
import graphql from 'graphql'
import graphqlHTTP from 'express-graphql'
import schema from './schema'

var graphQLServer = express()
graphQLServer.use('/', graphqlHTTP({
  schema: schema,
  graphiql: true
}))
graphQLServer.listen(8000)

console.log('The GraphQL Server is running on port 8000.')
