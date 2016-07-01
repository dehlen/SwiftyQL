//
//  GraphQLBuilder.swift
//  MonsterSafari
//
//  Created by David Ehlen on 27.06.16.
//  Copyright © 2016 David Ehlen. All rights reserved.
//

import Foundation

struct GraphQLBuilder {
    static func allMovies() -> String {
        let query = Query(withAlias: "allMovies",
                          readingRequest: ReadingRequest(name: "movies",
                            fields: ["name", "id"]))
        return query.create()
    }
    
    static func movie(withId id: String) -> String {
        let query = Query(withAlias: "movieWithId",
                          readingRequest: ReadingRequest(name: "movie",
                            arguments:[Argument(key: "id", value: id)],
                            fields: ["name", "id"]))
        return query.create()
    }
    
    static func createMovie(withName movieName: String) -> String {
        let mutatingRequest = MutatingRequest(mutationName: "createMovie",
            mutationArgument: Argument(
                key: "name",
                value: movieName
            ),
            responseFields: [
                "name",
                "id"
            ]
        )
        
        let mutation = Mutation(
            withAlias: "createMovieWithName",
            mutatingRequest: mutatingRequest
        )
        return mutation.create()
    }
}
