//
//  WrongRequest.swift
//  StarWarsAppTests
//
//  Created by atme on 13/07/2022.
//

import Foundation

struct WrongRequest: RequestTemplate {
    let method: HTTPMethod = .GET
    var path = "error"
    var parameters: [URLQueryItem] = []
    var headers: [String: String] = [:]
    var body: Data? = nil
}
