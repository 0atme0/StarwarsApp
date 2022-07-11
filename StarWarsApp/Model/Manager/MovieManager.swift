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
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    public func getMovieList(completion: @escaping MoviesResultClosure) {
        requestMovieList() { result in
            print(result)
            switch result {
            case .success(let data):
                do {
                    let value = try self.jsonDecoder.decode(SearchResult.self, from: data)
                    let list = value.results.sorted(by: {$0.episodeID < $1.episodeID})
                    completion(.success(list))
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
