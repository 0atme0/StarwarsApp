//
//  NetworkManagerProtocol.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func resumeDataTask(withRequest request: RequestTemplate, completion: @escaping (Swift.Result<Data, Error>) -> Void)
}
