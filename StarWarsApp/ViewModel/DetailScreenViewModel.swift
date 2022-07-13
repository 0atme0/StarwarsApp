//
//  DetailScreenViewModel.swift
//  StarWarsApp
//
//  Created by atme on 11/07/2022.
//

import Foundation
import SwiftUI

class DetailScreenViewModel: DetailScreenViewModelProtocol {
    
    @Binding var movie: Movie?
    
    init(_ movie: Binding<Movie?>) {
        self._movie = movie
    }
    
    public func close() {
        withAnimation(.ripple(index: 0)) {
            self.movie = nil
        }
    }
}
