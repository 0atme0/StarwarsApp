//
//  URLRequest+init.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

extension URLRequest {
    init?(with request: RequestTemplate, baseURL: String) {
        guard let fullURL = request.fullURL(baseURL: baseURL) else { return nil }

        self.init(url: fullURL)
        self.httpMethod = request.method.rawValue

        for (key, value) in request.headers {
            self.addValue(value, forHTTPHeaderField: key)
        }
    }
}
