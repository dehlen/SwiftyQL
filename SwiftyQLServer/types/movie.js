import { GraphQLObjectType, GraphQLString, GraphQLNonNull } from 'graphql'

export default new GraphQLObjectType({
  name: 'Movie',
  description: 'A movie',
  fields: {
    id: {
      type: new GraphQLNonNull(GraphQLString),
      description: 'The ID of the movie'
    },
    name: {
      type: GraphQLString,
      description: 'The name of the movie'
    }
  }
})
