//
//  Mutation.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 26/05/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

/** Contains the complete GraphQL mutation and creates a String representation that can be read by GraphQL
 
 ***Example usage:***
 ```swift
 let mutationRequest = Request(
    name: "editMe",
    arguments: [
      Argument(
        key: "input",
        values: [
          Value(withFields: [
            MutatingField(key: "name", value: "joe"),
            MutatingField(key: "age", value: 99)
            ]
          )
        ]
      )
    ],
    fields: [
      "name",
      "age"
    ]
 )

 ```
 */
public struct Mutation: Operation {
  private let alias: String
  private let request: Request
  private let fragments: [Fragment]
  private let queryType: QueryType

  public init(withAlias alias: String, mutatingRequest request: MutatingRequest, fragments: [Fragment] = []) {
    self.alias = alias
    self.request = request
    self.fragments = fragments
    self.queryType = .Mutation
  }
  
  public func create() -> String {
    return "mutation \(alias) {\(request.asGraphQLString)}\(fragments.map {$0.asGraphQLString}.joinWithSeparator(""))"
  }
}

extension Mutation {
  public var debugDescription: String {
    // swiftlint:disable line_length
    return "\nquery \(alias) {\n\t\(request.debugDescription)\n}\n\(fragments.map {$0.debugDescription}.joinWithSeparator(""))\n"
    // swiftlint:enable line_length
  }
}
