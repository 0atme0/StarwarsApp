//
//  MockNetworkManager.swift
//  StarWarsAppTests
//
//  Created by atme on 13/07/2022.
//

import Foundation

class MockNetworkManager: NetworkManagerProtocol {
    func resumeDataTask(withRequest request: RequestTemplate, completion: @escaping (Result<Data, Error>) -> Void) {
        completion(.failure(NetworkError.emptyData))
    }
}
