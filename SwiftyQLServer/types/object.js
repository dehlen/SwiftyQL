import { GraphQLObjectType, GraphQLString, GraphQLNonNull } from 'graphql'

export default new GraphQLObjectType({
  name: 'Object',
  description: 'An object',
  fields: {
    id: {
      type: new GraphQLNonNull(GraphQLString),
      description: 'The ID of the object'
    },
    name: {
      type: GraphQLString,
      description: 'The name of the object'
    }
  }
})
