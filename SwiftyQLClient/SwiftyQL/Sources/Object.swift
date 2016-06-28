//
//  Object.swift
//  SwiftyQL
//
//  Created by David Ehlen on 28.06.16.
//  Copyright © 2016 David Ehlen. All rights reserved.
//

import Mapper

struct Object: Mappable {
    
    let id: String
    let name: String
    
    init(map: Mapper) throws {
        try id = map.from("id")
        try name = map.from("name")
    }
    
}