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
    
    func allMovies() -> Observable<[Movie]> {
        return self.provider
            .request(APIEndpoint.AllMovies)
            .debug()
            .mapArray(Movie.self, keyPath: "data.movies")
    }
    
    func movieWithId(id: String) -> Observable<Movie> {
        return self.provider
            .request(APIEndpoint.MovieWithId(id: id))
            .debug()
            .mapObject(Movie.self, keyPath: "data.movie")
    }
    
    func createMovieWithName(name: String) -> Observable<Movie> {
        return self.provider
            .request(APIEndpoint.CreateMovieWithName(name: name))
            .debug()
            .mapObject(Movie.self, keyPath: "data.createMovie")
    }
}
