//
//  DetailScreenViewModelProtocol.swift
//  StarWarsApp
//
//  Created by atme on 13/07/2022.
//

import Foundation

protocol DetailScreenViewModelProtocol: ViewModelProtocol {
    var movie: Movie? {get}
    func close()
}
