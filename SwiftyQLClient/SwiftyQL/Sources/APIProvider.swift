//
//  APIProvider.swift
//  MonsterSafari
//
//  Created by David Ehlen on 28.06.16.
//  Copyright © 2016 David Ehlen. All rights reserved.
//

import Moya
import RxSwift
import Mapper
import Moya_ModelMapper

struct APIProvider {
    let provider: RxMoyaProvider<APIEndpoint>
    
    func allObjects() -> Observable<[Object]> {
        return self.provider
            .request(APIEndpoint.AllObjects)
            .debug()
            .mapArray(Object.self, keyPath: "data.objects")
    }
    
    func objectWithId(id: String) -> Observable<Object> {
        return self.provider
            .request(APIEndpoint.ObjectWithId(id: id))
            .debug()
            .mapObject(Object.self, keyPath: "data.object")
    }
    
    func createObjectWithName(name: String) -> Observable<Object> {
        return self.provider
            .request(APIEndpoint.CreateObjectWithName(name: name))
            .debug()
            .mapObject(Object.self, keyPath: "data.createObject")
    }
}
