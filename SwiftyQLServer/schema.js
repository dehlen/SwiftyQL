import { GraphQLObjectType, GraphQLSchema, GraphQLString, GraphQLList } from 'graphql'
import movieType from './types/movie'

const movie = { }

export default new GraphQLSchema({
  query: new GraphQLObjectType({
    name: 'Query',
    fields: {
      // a movie with an ID
      movie: {
        type: movieType,
        args: {
          id: {
            type: GraphQLString
          }
        },
        resolve: (_, { id }) => movie[id]
      },
      // all movies
      movies: {
        type: new GraphQLList(movieType),
        resolve: () => Object.keys(movie).map(id => movie[id])
      }
    }
  }),

  mutation: new GraphQLObjectType({
    name: 'Mutation',
    fields: {
      createMovie: {
        type: movieType,
        args: {
          name: {
            name: 'name',
            type: GraphQLString
          }
        },
        resolve: (_, { name }) => {
          const mov = {
            id: Object.keys(movie).length + 1,
            name: name
          }
          movie[Object.keys(movie).length + 1] = mov
          return mov
        }
      }
    }
  })
})
