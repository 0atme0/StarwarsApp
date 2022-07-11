//
//  NetworkManager.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

class NetworkManager {
    func resumeDataTask(withRequest request: RequestTemplate, completion: @escaping (Swift.Result<Data, Error>) -> Void) {
        guard let urlRequest = URLRequest(with: request, baseURL: Constant.urlString) else {fatalError()}
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NetworkError.emptyData))
            }
        }
        dataTask.resume()
    }
}
