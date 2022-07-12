//
//  DetailScreenViewModel.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import Foundation
import SwiftUI

protocol DetailScreenViewModelProtocol: ViewModelProtocol {
    var movie: Movie? {get}
    func close()
}

class DetailScreenViewModel: DetailScreenViewModelProtocol {
    
    @Binding var movie: Movie?
    
    init(_ movie: Binding<Movie?>) {
        self._movie = movie
    }
    
    public func close() {
        self.movie = nil
    }
}
