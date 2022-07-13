//
//  MockMovieManager.swift
//  StarWarsAppTests
//
//  Created by atme on 13/07/2022.
//

import Foundation

class MockMovieManager: MovieManagerProtocol {
    private let movie: [Movie]
    init(mockMovieList: [Movie]) {
        self.movie = mockMovieList
    }
    func getMovieList(completion: @escaping MoviesResultClosure) {
        completion(.success(movie))
    }
}
