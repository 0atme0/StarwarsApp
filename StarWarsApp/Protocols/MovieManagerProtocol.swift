//
//  MovieManagerProtocol.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

protocol MovieManagerProtocol {
    func getMovieList(completion: @escaping MoviesResultClosure)
}
