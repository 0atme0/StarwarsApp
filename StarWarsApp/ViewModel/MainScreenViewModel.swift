//
//  MainScreenViewModel.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import Foundation
import Combine
import SwiftUI

class MainScreenViewModel: MainScreenViewModelProtocol {
    
    private let movieManager: MovieManagerProtocol
    @Published var movies: [Movie] = []
    @Published var filteredMovies: [Movie] = []
    @Published var isLoading = false
    @Published var isError: String?
    @Published var selectedMovie: Movie?
    @Published var selectedFilter: FilterType?
    @Published var filterList: [FilterType] = []
    @Published var searchText: String = ""
    var storage = Set<AnyCancellable>()
    
    init(movieManager: MovieManagerProtocol) {
        self.movieManager = movieManager
        getMovies()
        setupProperties()
        setupBindings()
    }
    //MARK: - private methods
    private func setupProperties() {
        filterList = getFilterList()
    }
    private func setupBindings() {
        $searchText
            .sink { [weak self] value in
                guard !value.isEmpty else {
                    self?.filteredMovies = self?.movies ?? []
                    return
                }
                guard let selectedFilter = self?.selectedFilter else {
                    return
                }
                self?.filteredMovies = self?.search(text: value, filter: selectedFilter) ?? []
            }
            .store(in:&storage)
    }
    private func getMovies() {
        self.isLoading = true
        movieManager.getMovieList { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let list):
                    self.movies = list
                    self.filteredMovies = list
                case .failure(let error):
                    self.isError = error.localizedDescription
                }
            }
        }
    }
    
    private func getFilterList() -> [FilterType] {
        [.director, .opening_crawl, .producers, .title]
    }
    
    private func search(text: String, filter: FilterType) -> [Movie] {
        switch filter {
        case .director:
            return movies.filter{$0.director.localizedLowercase.contains(text.localizedLowercase)}
        case .opening_crawl:
            return movies.filter{$0.openingCrawl.localizedLowercase.contains(text.localizedLowercase)}
        case .producers:
            return movies.filter{$0.producer.localizedLowercase.contains(text.localizedLowercase)}
        case .title:
            return movies.filter{$0.title.localizedLowercase.contains(text.localizedLowercase)}
        }
    }
    
    //MARK: - public methods
    public func selectFilter(_ filter: FilterType) {
        self.searchText = ""
        self.selectedFilter = filter
    }
    
    public func selectMovie(_ movie: Movie) {
        withAnimation(.ripple(index: 0)) {
            self.selectedMovie = movie
        }
    }
    
    public func search(_ searchText: String) {
        self.searchText = searchText
    }
}
