//
//  MainScreenView+List.swift
//  StarWarsApp
//
//  Created by atme on 12/07/2022.
//

import SwiftUI

extension MainScreenView {
    var list: some View {
        Group {
            if vm.isLoading {
                VStack {
                    ProgressView()
                    Spacer()
                }
            } else {
                ScrollView {
                    ForEach(vm.filteredMovies, id: \.self) { movie in
                        MainScreenCellView(namespace: namespace, movie: movie)
                            .onTapGesture {
                                vm.selectMovie(movie)
                            }
                    }
                }
            }
        }
    }
}
