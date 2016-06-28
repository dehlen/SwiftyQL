import { GraphQLObjectType, GraphQLSchema, GraphQLString, GraphQLList } from 'graphql'
import objectType from './types/object'

const object = { }

export default new GraphQLSchema({
  query: new GraphQLObjectType({
    name: 'Query',
    fields: {
      // a object with an ID
      object: {
        type: objectType,
        args: {
          id: {
            type: GraphQLString
          }
        },
        resolve: (_, { id }) => object[id]
      },
      // all objects
      objects: {
        type: new GraphQLList(objectType),
        resolve: () => Object.keys(object).map(id => object[id])
      }
    }
  }),

  mutation: new GraphQLObjectType({
    name: 'Mutation',
    fields: {
      createObject: {
        type: objectType,
        args: {
          name: {
            name: 'name',
            type: GraphQLString
          }
        },
        resolve: (_, { name }) => {
          const obj = {
            id: Object.keys(object).length + 1,
            name: name
          }
          object[Object.keys(object).length + 1] = obj
          return obj
        }
      }
    }
  })
})
