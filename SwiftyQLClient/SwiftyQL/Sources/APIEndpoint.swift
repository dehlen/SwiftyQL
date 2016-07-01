//
//  APIEndpoint.swift
//  MonsterSafari
//
//  Created by David Ehlen on 28.06.16.
//  Copyright © 2016 David Ehlen. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum APIEndpoint {
    case AllMovies
    case MovieWithId(id: String)
    case CreateMovieWithName(name: String)
}

let graphQLEncodingClosure: (URLRequestConvertible,
    [String:AnyObject]?) -> (NSMutableURLRequest, NSError?) = { request, data in
    var req = request.URLRequest as NSMutableURLRequest
        let error = NSError(domain: "com.swiftyQL.GraphQLDataError", code: 422, userInfo:nil)
        
        guard let queryData = data else {
            return (req, error)
        }
        
        guard let query = queryData["body"] as? String else {
            let error = NSError(domain: "", code: 422, userInfo:nil)
            return (req, error)
        }
        
        req.setValue("application/graphql; charset=utf-8", forHTTPHeaderField: "Content-Type")
        req.HTTPBody = query.dataUsingEncoding(NSUTF8StringEncoding)
        return (req, nil)
}

extension APIEndpoint: TargetType {
    var baseURL: NSURL { return NSURL(string: "http://localhost:8000")! }
    
    var path: String {
        return "/"
    }
    
    var method: Moya.Method {
        return .POST
    }
    
    var parameters: [String: AnyObject]? {
        switch self {
        case .AllMovies:
            return ["body": GraphQLBuilder.allMovies()]
        case .MovieWithId(let id):
            return ["body": GraphQLBuilder.movie(withId: id)]
        case .CreateMovieWithName(let name):
            return ["body": GraphQLBuilder.createMovie(withName: name)]
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        return ParameterEncoding.Custom(graphQLEncodingClosure)
    }
    
    var sampleData: NSData {
        switch self {
        case .AllMovies:
            return "{\"data\":{\"movies\":[{\"name\":\"Inception\",\"id\":\"1\"}]}}"
                .dataUsingEncoding(NSUTF8StringEncoding)!
        case .MovieWithId(_):
            return "{\"data\":{\"movie\":{\"name\":\"Inception\",\"id\":\"1\"}}}"
                .dataUsingEncoding(NSUTF8StringEncoding)!
        case .CreateMovieWithName(_):
            return "{\"data\":{\"createMovie\":{\"name\":\"Inception\",\"id\":\"1\"}}}"
                .dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }
}
