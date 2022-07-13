//
//  MovieListRequest.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

struct MovieListRequest: RequestTemplate {
    let method: HTTPMethod = .GET
    var path = "/api/films"
    var parameters: [URLQueryItem] = []
    var headers: [String: String] = [:]
    var body: Data? = nil
}
