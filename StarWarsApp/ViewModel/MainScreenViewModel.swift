//
//  MainScreenViewModel.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

protocol MainScreenViewModelProtocol: ViewModelProtocol {
    var movies: [Movie] {get}
}


class MainScreenViewModel: MainScreenViewModelProtocol {
    
    private let movieManager: MovieManagerProtocol
    
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var isError: String?

    init(movieManager: MovieManagerProtocol) {
        self.movieManager = movieManager
        getMovies()
    }
    
    private func getMovies() {
        self.isLoading = true
        movieManager.getMovieList { result in
            self.isLoading = false
            switch result {
            case .success(let list):
                self.movies = list
            case .failure(let error):
                self.isError = error.localizedDescription
            }
        }
    }
}
