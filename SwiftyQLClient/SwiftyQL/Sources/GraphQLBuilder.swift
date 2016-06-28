//
//  GraphQLBuilder.swift
//  MonsterSafari
//
//  Created by David Ehlen on 27.06.16.
//  Copyright © 2016 David Ehlen. All rights reserved.
//

import Foundation

struct GraphQLBuilder {
    static func allObjects() -> String {
        let query = Query(withAlias: "allObjects",
                          readingRequest: ReadingRequest(name: "objects",
                            fields: ["name", "id"]))
        return query.create()
    }
    
    static func object(withId id: String) -> String {
        let query = Query(withAlias: "objectsWithId",
                          readingRequest: ReadingRequest(name: "object",
                            arguments:[Argument(key: "id", value: id)],
                            fields: ["name", "id"]))
        return query.create()
    }
    
    static func createObject(withName objectName: String) -> String {
        let mutatingRequest = MutatingRequest(mutationName: "createObject",
            mutationArgument: Argument(
                key: "name",
                value: objectName
            ),
            responseFields: [
                "name",
                "id"
            ]
        )
        
        let mutation = Mutation(
            withAlias: "createObjectWithName",
            mutatingRequest: mutatingRequest
        )
        return mutation.create()
    }
}
