//
//  MainScreenViewModel.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

protocol MainScreenViewModelProtocol: ViewModelProtocol {
    var movies: [Movie] {get}
    var isLoading: Bool {get}
    var isError: String? {get}
    var selectedMovie: Movie? {get set}
}


class MainScreenViewModel: MainScreenViewModelProtocol {
    
    private let movieManager: MovieManagerProtocol
    
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var isError: String?
    @Published var selectedMovie: Movie?
    
    init(movieManager: MovieManagerProtocol) {
        self.movieManager = movieManager
        getMovies()
    }
    
    private func getMovies() {
        self.isLoading = true
        movieManager.getMovieList { result in
            DispatchQueue.main.async {
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
}
