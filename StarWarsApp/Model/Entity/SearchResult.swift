//
//  SearchResult.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

struct SearchResult: Codable {
    let count: Int
    let next, previous: JSONNull?
    let results: [Result]
}
