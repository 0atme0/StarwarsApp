//
//  MovieManager.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

typealias MoviesResult = Result<[Movie], Error>
typealias MoviesResultClosure = (Result<[Movie], Error>) -> ()

class MovieManager: MovieManagerProtocol {
    
    private let session = URLSession.shared
    private lazy var jsonDecoder = JSONDecoder()
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    public func getMovieList(completion: @escaping MoviesResultClosure) {
        requestMovieList() { result in
            switch result {
            case .success(let data):
                do {
                    let value = try self.jsonDecoder.decode(SearchResult.self, from: data)
                    completion(.success(value.results))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    private func requestMovieList(completion: @escaping (Result<Data, Error>) -> ()) {
        let request = MovieListRequest()
        networkManager.resumeDataTask(withRequest: request, completion: completion)
    }
}
