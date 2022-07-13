//
//  MainScreenViewModelProtocol.swift
//  StarWarsApp
//
//  Created by atme on 13/07/2022.
//

import Foundation

protocol MainScreenViewModelProtocol: ViewModelProtocol {
    var movies: [Movie] {get}
    var filteredMovies: [Movie] {get}
    var isLoading: Bool {get}
    var isError: String? {get}
    var selectedMovie: Movie? {get set}
    var selectedFilter: FilterType? {get}
    var filterList: [FilterType] {get}
    var searchText: String {get set}
    
    func selectFilter(_ filter: FilterType)
    func selectMovie(_ movie: Movie)
}
