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
    case AllObjects
    case ObjectWithId(id: String)
    case CreateObjectWithName(name: String)
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
        case .AllObjects:
            return ["body": GraphQLBuilder.allObjects()]
        case .ObjectWithId(let id):
            return ["body": GraphQLBuilder.object(withId: id)]
        case .CreateObjectWithName(let name):
            return ["body": GraphQLBuilder.createObject(withName: name)]
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        return ParameterEncoding.Custom(graphQLEncodingClosure)
    }
    
    var sampleData: NSData {
        switch self {
        case .AllObjects:
            return "{\"data\":{\"objects\":[{\"name\":\"My object\",\"id\":\"1\"}]}}"
                .dataUsingEncoding(NSUTF8StringEncoding)!
        case .ObjectWithId(_):
            return "{\"data\":{\"object\":{\"name\":\"My object\",\"id\":\"1\"}}}"
                .dataUsingEncoding(NSUTF8StringEncoding)!
        case .CreateObjectWithName(_):
            return "{\"data\":{\"createObject\":{\"name\":\"My object\",\"id\":\"1\"}}}"
                .dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }
}
