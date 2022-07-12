//
//  RequestTemplate.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

protocol RequestTemplate {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [URLQueryItem] { get }
    var headers: [String: String] { get }
    var body: Data? { get }
}
extension RequestTemplate {
    func fullURL(baseURL: String) -> URL? {
        URL(string: baseURL + path)
    }
}
